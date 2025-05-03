# **Scam Tracker**
It is a web based application where users can log in, create account, report or view a scam. If they would like they can also view the prevention tips and scam authorities to contact.

**Tech Stack:**

Frontend: React.js
Backend: Flask (Python)
Styling: CSS

**Features:**

1. Authentication: Users can create account and log in with the created account credentials.
2. Scam Reporting: The users will be able to submit scams by filling out a form containing Scam Type as a dropdown, Date, Country, Financial Loss and Description.
3. Contacting Scam Authorities: They will be able to view the conancts of the authorities as soon as the enter thr Country and hit search.
4. Prevnetion Tips: When they hit the load tips button the will be able to view the tips accordingly.
5. UI: The UI is conventiionally built as it has simple UI and easy to understand feedbacks.

**Installation & Set up:**

1. Clone the Repository:

   git clone https://github.com/yourusername/Scam-Tracker-.git

cd Scam-Tracker-

2. Install:

   pip install flask flask-cors flask-sqlalchemy flask-bcrypt python-dotenv psycopg2-binary

3. This goes in the .env file in the backend, named backscamtrackerclient:

   .env
    
   DB_USER=your_pg_username
    
   DB_PASSWORD=your_pg_password
    
   DB_HOST=localhost
    
   DB_PORT=5432
    
   DB_DATABASE=your_database_name
    
   SECRET_KEY=a-secure-random-string
    
   FLASK_ENV=development
    
   Note: The .env file must be edited with individuals credentials.

         The secret key can be obtained by running this command, openssl rand -hex 32.
         The value derived must be pasted in a-secure-random-string.

4. Set up Backend:

   cd backscamtrackerclient

   export FLASK_APP=app.py

   export FLASK_ENV=development

   flask run

5. Set up Frontend:

   cd frontscamtrackerclient

   npm install

   npm start

**User Testing:**

After the installlation and set up users can create their account with any dummy values if haven't already and log in to the Scam Tracker.

Then they can report the scam, search for authorities or prevention tips to check the usability.
