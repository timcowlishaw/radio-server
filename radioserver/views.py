from flask import request, jsonify
from radioserver import app
from radioserver.models import *


@app.route("/parse_email", methods=["POST"])
def parse_email():
    data = request.get_json()
    print(data)
    return jsonify({'status': 'OK'})
