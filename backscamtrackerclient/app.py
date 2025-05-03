# app.py
import os
from dotenv import load_dotenv
from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from sqlalchemy import text
from datetime import datetime

# ─── App & DB setup ─────────────────────────────────
load_dotenv()
app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'change-me-in-production')

CORS(app,
     resources={r"/api/*": {"origins": "http://localhost:3000"}},
     supports_credentials=True,
     allow_headers=["Content-Type", "Authorization"],
     methods=["GET","POST","PUT","DELETE","OPTIONS"]
)

app.config['DEBUG'] = os.getenv('FLASK_ENV') == 'development'
DB_URI = (
    f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}"
    f"@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT', '5432')}"
    f"/{os.getenv('DB_DATABASE')}"
)
app.config['SQLALCHEMY_DATABASE_URI'] = DB_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db     = SQLAlchemy(app)
bcrypt = Bcrypt(app)

# ─── Models ─────────────────────────────────────────
class User(db.Model):
    __tablename__ = 'users'
    uid           = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_name     = db.Column(db.String(50), unique=True, nullable=False)
    user_email    = db.Column(db.String(50), unique=True, nullable=False)
    user_password = db.Column(db.String(150), nullable=False)
    user_phone    = db.Column(db.String(100))
    user_type     = db.Column(db.String(10),   default='Free')

class ScamType(db.Model):
    __tablename__ = 'scam_types'
    tid              = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type_name        = db.Column(db.String(50), nullable=False)
    type_description = db.Column(db.String(100))

class ScamReport(db.Model):
    __tablename__ = 'scam_reports'
    # <-- explicitly request autoincrement
    rid                = db.Column(db.Integer, primary_key=True, autoincrement=True)
    uid                = db.Column(db.Integer, db.ForeignKey('users.uid'), nullable=False)
    tid                = db.Column(db.Integer, db.ForeignKey('scam_types.tid'), nullable=False)
    report_loss        = db.Column(db.Float)
    report_description = db.Column(db.Text)
    report_date        = db.Column(db.Date)
    report_country     = db.Column(db.String(100))

class ScamAuthority(db.Model):
    __tablename__ = 'scam_authorities'
    org_id      = db.Column(db.Integer, primary_key=True, autoincrement=True)
    org_name    = db.Column(db.String(50), nullable=False)
    org_country = db.Column(db.String(100))
    org_contact = db.Column(db.String(100))

class ScamPreventionTip(db.Model):
    __tablename__ = 'scam_prevention_tips'
    tid      = db.Column(db.Integer, db.ForeignKey('scam_types.tid'), primary_key=True)
    tip_text = db.Column(db.String(500), nullable=False)

with app.app_context():
    # ————— ensure sequences & defaults for users.uid —————
    db.session.execute(text("CREATE SEQUENCE IF NOT EXISTS users_uid_seq;"))
    db.session.execute(text(
        "ALTER TABLE users "
        "ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq');"
    ))
    db.session.execute(text(
        "SELECT setval('users_uid_seq', COALESCE((SELECT MAX(uid) FROM users), 0));"
    ))

    # ————— add sequence & default for scam_reports.rid —————
    db.session.execute(text("CREATE SEQUENCE IF NOT EXISTS scam_reports_rid_seq;"))
    db.session.execute(text(
        "ALTER TABLE scam_reports "
        "ALTER COLUMN rid SET DEFAULT nextval('scam_reports_rid_seq');"
    ))
    db.session.execute(text(
        "SELECT setval('scam_reports_rid_seq', COALESCE((SELECT MAX(rid) FROM scam_reports), 0));"
    ))

    # ————— create all tables that don’t yet exist —————
    db.create_all()
    db.session.commit()


# ─── Auth routes ────────────────────────────────────
@app.route('/api/auth/register', methods=['POST'])
def register():
    data  = request.get_json() or {}
    name  = (data.get('user_name')  or '').strip()
    email = (data.get('user_email') or '').strip()
    pwd   = data.get('user_password') or ''
    phone = (data.get('user_phone')  or '').strip()

    if not name or not email or not pwd:
        return jsonify(message='Name, email, and password required'), 400

    if User.query.filter(
        (User.user_name == name) | (User.user_email == email)
    ).first():
        return jsonify(message='User already exists'), 409

    hashed = bcrypt.generate_password_hash(pwd).decode('utf-8')
    user = User(user_name=name, user_email=email,
                user_password=hashed, user_phone=phone)
    db.session.add(user)
    db.session.commit()
    return jsonify(message='User created'), 201

@app.route('/api/auth/login', methods=['POST'])
def login():
    data  = request.get_json() or {}
    email = (data.get('user_email') or '').strip()
    pwd   = data.get('user_password') or ''
    if not email or not pwd:
        return jsonify(message='Email and password required'), 400

    user = User.query.filter_by(user_email=email).first()
    if not user or not bcrypt.check_password_hash(user.user_password, pwd):
        return jsonify(message='Invalid credentials'), 401

    # return uid so the front end can store it
    return jsonify(message='Logged in', uid=user.uid, user_name=user.user_name), 200


# ─── Scam API ───────────────────────────────────────
@app.route('/api/scam/types', methods=['GET'])
def get_scam_types():
    types = ScamType.query.all()
    return jsonify([
        {'tid': t.tid, 'type_description': t.type_description}
        for t in types
    ]), 200

@app.route('/api/scam/report', methods=['POST'])
def create_scam_report():
    data = request.get_json() or {}

    # — pull uid from JSON and coerce to int —
    try:
        uid = int(data.get('uid'))
    except (TypeError, ValueError):
        return jsonify(message='Valid uid required'), 400

    try:
        tid  = int(data.get('tid'))
        loss = float(data.get('report_loss'))
    except (TypeError, ValueError):
        return jsonify(message='tid and report_loss must be numbers'), 400

    date    = data.get('report_date')
    country = (data.get('report_country') or '').strip()
    desc    = (data.get('report_description') or '').strip()

    if not all([tid, date, country, loss, desc]):
        return jsonify(message='All fields required'), 400

    try:
        rpt = ScamReport(
            uid=uid,
            tid=tid,
            report_date=date,
            report_country=country,
            report_loss=loss,
            report_description=desc
        )
        db.session.add(rpt)
        db.session.commit()
        return jsonify(message='Report created'), 201

    except Exception as e:
        db.session.rollback()
        app.logger.exception("Error creating scam report")
        return jsonify(message=str(e)), 500

@app.route('/api/scam/authorities', methods=['GET'])
def get_authorities():
    country = (request.args.get('country') or '').strip()
    if not country:
        return jsonify(message='Country required'), 400

    auths = ScamAuthority.query.filter_by(org_country=country).all()
    return jsonify([
        {'org_id': a.org_id, 'org_name': a.org_name, 'org_contact': a.org_contact}
        for a in auths
    ]), 200

@app.route('/api/scam/tips', methods=['GET'])
def get_tips():
    tips = ScamPreventionTip.query.all()
    return jsonify([
        {'tid': t.tid, 'tip_text': t.tip_text}
        for t in tips
    ]), 200

@app.route('/api/scam/reports-by-country', methods=['GET'])
def reports_by_country():
    
    rows = db.session.execute(text("""
       SELECT report_country AS country,
              COUNT(*)         AS count
         FROM scam_reports
        GROUP BY report_country
        ORDER BY count DESC
    """)).fetchall()

    return jsonify([
      {"country": r.country, "count": r.count}
      for r in rows
    ]), 200
@app.route('/api/scam/reports', methods=['GET'])
def get_user_reports():
    uid = request.args.get('uid')
    if not uid:
        return jsonify(message='uid required'), 400
    try:
        uid = int(uid)
    except ValueError:
        return jsonify(message='invalid uid'), 400

    reports = ScamReport.query.filter_by(uid=uid).all()
    return jsonify([
        {
            'rid': r.rid,
            'tid': r.tid,
            'report_date': r.report_date.isoformat(),
            'report_country': r.report_country,
            'report_loss': r.report_loss,
            'report_description': r.report_description
        }
        for r in reports
    ]), 200
@app.route('/api/scam/report/<int:rid>', methods=['PUT'])
def update_scam_report(rid):
    data = request.get_json() or {}
    try:
        uid = int(data.get('uid'))
    except (TypeError, ValueError):
        return jsonify(message='Valid uid required'), 400

    rpt = ScamReport.query.filter_by(rid=rid, uid=uid).first()
    if not rpt:
        return jsonify(message='Report not found'), 404

    # Update fields if provided
    if 'tid' in data:
        rpt.tid = int(data['tid'])
    if 'report_date' in data:
        rpt.report_date = datetime.fromisoformat(data['report_date']).date()
    if 'report_country' in data:
        rpt.report_country = data['report_country']
    if 'report_loss' in data:
        rpt.report_loss = float(data['report_loss'])
    if 'report_description' in data:
        rpt.report_description = data['report_description']

    db.session.commit()
    return jsonify(message='Report updated'), 200

@app.route('/api/scam/report/<int:rid>', methods=['DELETE'])
def delete_scam_report(rid):
    data = request.get_json() or {}
    try:
        uid = int(data.get('uid'))
    except (TypeError, ValueError):
        return jsonify(message='Valid uid required'), 400

    rpt = ScamReport.query.filter_by(rid=rid, uid=uid).first()
    if not rpt:
        return jsonify(message='Report not found'), 404

    db.session.delete(rpt)
    db.session.commit()
    return jsonify(message='Report deleted'), 200
# ─── Run ────────────────────────────────────────────
if __name__ == '__main__':
    port = int(os.getenv('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
