## Prequistes 
- Use python3.9 or newer

## Packages to install:
- flask
- flask_wtf
- email_validator
- flask-sqlalchemy
- flask-bcrypt
- flask-login
- jaeger-client
- newrelic
- gunicorn

------------------------------------
## Prerequistes
### Install Python Packages
```
pipenv install -r requirements.txt
```
## Run app
```
python app.py
```

## To Do
- Configure app to use Aurora RDS instead of sqlite

update - environment variable to include NEW RELIC config

## Deploying to Heroku
- Create an environment variable for NEW_RELIC_CONFIG_FILE in the project settings. (cli or UI)