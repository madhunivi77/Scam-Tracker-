# Scam Tracker

A simple web application for tracking and reporting scams.  
This repository contains a **Flask** backend (with session‑based auth) and a **React** frontend.

---

## Table of Contents

1. [Prerequisites](#prerequisites)  
2. [Backend Setup](#backend-setup)  
   1. [Clone & Virtual Environment](#clone--virtual-environment)  
   2. [Install Dependencies](#install-dependencies)  
   3. [Configure Environment Variables](#configure-environment-variables)  
   4. [Initialize Database & Run](#initialize-database--run)  
3. [Frontend Setup](#frontend-setup)  
   1. [Clone & Install Dependencies](#clone--install-dependencies)  
   2. [Run in Development](#run-in-development)  
4. [API Endpoints](#api-endpoints)  
5. [CORS & Cookies](#cors--cookies)  
6. [Project Structure](#project-structure)  

---

## Prerequisites

- Python 3.7+  
- Node.js & npm (Node 16+ recommended)  
- PostgreSQL (running locally or remotely)  
- A modern web browser (Chrome, Firefox, Safari, etc.)

---

## Backend Setup

### Clone & Virtual Environment

```bash
# In your source directory:
git clone <your-backend-repo-url> scam-tracker-backend
cd scam-tracker-backend

# (Optional but recommended)
python3 -m venv venv
source venv/bin/activate      # macOS/Linux
venv\Scripts\activate.bat   # Windows
```

### Install Dependencies

```bash
pip install \
  flask \
  flask-cors \
  flask-sqlalchemy \
  flask-bcrypt \
  python-dotenv \
  psycopg2-binary
```

### Configure Environment Variables

Create a file named `.env` in the backend root:

```ini
# .env
DB_USER=your_pg_username
DB_PASSWORD=your_pg_password
DB_HOST=localhost
DB_PORT=5432
DB_DATABASE=your_database_name

# Used to sign Flask’s session cookie. Replace with a strong random string!
SECRET_KEY=some-secure-random-value

# Optional: turn on debug mode
FLASK_ENV=development
```

### Initialize Database & Run

No manual migrations needed—the app auto-creates tables & sequences.

```bash
export FLASK_APP=app.py
export FLASK_ENV=development    # optional
flask run                       # launches on http://127.0.0.1:5000
```

You should see:

```
 * Serving Flask app "app.py"
 * Environment: development
 * Debug mode: on
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```

---

## Frontend Setup

### Clone & Install Dependencies

```bash
# In a separate terminal:
git clone <your-frontend-repo-url> scam-tracker-frontend
cd scam-tracker-frontend
npm install
```

### Run in Development

```bash
npm start
```

This will open http://localhost:3000 in your browser.

---

## API Endpoints

| Method | Path                    | Description                         |
| ------ | ----------------------- | ----------------------------------- |
| POST   | `/api/auth/register`    | Create a new user                   |
| POST   | `/api/auth/login`       | Log in (sets session cookie)        |
| GET    | `/api/auth/me`          | Return current user (reads session) |

---

## CORS & Cookies

- Configured in **app.py** with:
  ```python
  CORS(
    app,
    resources={ r"/api/*": {"origins": ["http://localhost:3000"]} },
    supports_credentials=True
  )
  ```
- All frontend fetches that need cookies must include:
  ```js
  fetch(url, {
    credentials: 'include',
    ...
  })
  ```

---

## Project Structure

```
scam-tracker-backend/
├── app.py
├── .env
├── requirements.txt
└── ...

scam-tracker-frontend/
├── package.json
├── src/
│   ├── App.js
│   ├── components/
│   │   ├── LoginForm.js
│   │   ├── RegisterForm.js
│   │   └── Dashboard.js
│   └── ...
└── ...
```

---

You’re all set!  
1. **Register** at http://localhost:3000/register  
2. **Log in** at http://localhost:3000/  
3. **View Dashboard** at http://localhost:3000/dashboard  

Enjoy building and testing your Scam Tracker app!
