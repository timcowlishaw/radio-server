from flask import request, jsonify
from radioserver import app
from radioserver.models import *
import json

@app.route("/parse_email", methods=["POST"])
def parse_email():
    # we can't use request.get_json as IFTTT includes newlines in strings which is invalid JSON.
    data = json.loads(request.data, strict=False)
    print(data)
    return jsonify({'status': 'OK'})
