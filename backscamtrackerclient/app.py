import os
from dotenv import load_dotenv
from flask import Flask, request, jsonify, session
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from sqlalchemy import text


load_dotenv()  


app = Flask(__name__)

app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'change-me-in-production')

CORS(
    app,
    resources={ r"/api/*": {
        "origins": [
            "http://localhost:3000",
            "http://127.0.0.1:3000"
        ]
    }},
    supports_credentials=True,
    methods=["GET","POST","PUT","DELETE","OPTIONS"],
    allow_headers=["Content-Type", "Authorization"]
)
app.config['DEBUG'] = os.getenv('FLASK_ENV') == 'development'


DB_USER     = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_HOST     = os.getenv('DB_HOST')
DB_PORT     = os.getenv('DB_PORT', '5432')
DB_DATABASE = os.getenv('DB_DATABASE')

app.config['SQLALCHEMY_DATABASE_URI'] = (
    f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_DATABASE}'
)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


db     = SQLAlchemy(app)
bcrypt = Bcrypt(app)


class User(db.Model):
    __tablename__ = 'users'
    uid           = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_name     = db.Column(db.String(50), unique=True, nullable=False)
    user_email    = db.Column(db.String(50), unique=True, nullable=False)
    user_password = db.Column(db.String(150), nullable=False)
    user_phone    = db.Column(db.String(100))
    user_type     = db.Column(db.String(10), default='Free')


with app.app_context():
    
    db.session.execute(text("CREATE SEQUENCE IF NOT EXISTS users_uid_seq;"))

    db.session.execute(text(
        "ALTER TABLE users "
        "ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq');"
    ))
   
    db.session.execute(text(
        "SELECT setval('users_uid_seq', "
        "COALESCE((SELECT MAX(uid) FROM users), 0));"
    ))

    db.create_all()
    db.session.commit()


@app.route('/api/auth/register', methods=['POST'])
def register():
    try:
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

        
        hashed_pw = bcrypt.generate_password_hash(pwd).decode('utf-8')
        user = User(
            user_name     = name,
            user_email    = email,
            user_password = hashed_pw,
            user_phone    = phone
        )
        db.session.add(user)
        db.session.commit()

        return jsonify(message='User created'), 201

    except Exception as e:
        db.session.rollback()
        app.logger.exception("Error in /api/auth/register")
        return jsonify(message=str(e)), 500


@app.route('/api/auth/login', methods=['POST'])
def login():
    try:
        data  = request.get_json() or {}
        email = (data.get('user_email') or '').strip()
        pwd   = data.get('user_password') or ''

        
        if not email or not pwd:
            return jsonify(message='Email and password required'), 400

        
        user = User.query.filter_by(user_email=email).first()

        
        if not user or not bcrypt.check_password_hash(user.user_password, pwd):
            return jsonify(message='Invalid credentials'), 401

       
        session.clear()
        session['uid'] = user.uid

        return jsonify(
        message   = 'Logged in',
        uid       = user.uid,
        user_name = user.user_name
    ), 200

    except Exception as e:
        app.logger.exception("Error in /api/auth/login")
        return jsonify(message=str(e)), 500


@app.route('/api/auth/me', methods=['GET'])
def get_current_user():
    uid = session.get('uid')
    if not uid:
        return jsonify(message='Not authenticated'), 401

    user = User.query.get(uid)
    if not user:
        return jsonify(message='User not found'), 404

    return jsonify(
        uid        = user.uid,
        user_name  = user.user_name,
        user_email = user.user_email,
        user_phone = user.user_phone,
        user_type  = user.user_type
    ), 200


if __name__ == '__main__':
    port = int(os.getenv('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
