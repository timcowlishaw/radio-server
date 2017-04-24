from flask import Flask
from radioserver.database import db_session, init_db

app = Flask(__name__)

@app.teardown_appcontext
def shutdown_session(exception=None):
    db_session.remove()

@app.cli.command()
def initdb():
    init_db()

import radioserver.views

