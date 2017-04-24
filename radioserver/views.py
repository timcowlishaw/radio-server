from flask import request, jsonify
from radioserver import app
from radioserver.models import *
from radioserver.database import db_session
from radioserver.models import Programme
import json
import re

URL_REGEX="http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+"


@app.route("/parse_email", methods=["POST"])
def parse_email():
    # we can't use request.get_json as IFTTT includes newlines in strings which is invalid JSON.
    data = json.loads(request.data, strict=False)
    urls = re.findall(URL_REGEX, "%s %s" % (data["subject"], data["body"]))
    for url in urls:
        programme = Programme(url)
        db_session.add(programme)
    db_session.commit()
    return jsonify({'status': 'OK'})
