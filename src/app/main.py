#!/usr/bin/env python
# -*- coding: utf-8 -*-
from datetime import datetime
from flask import Flask, request
import json
import os
import socket
import sys

app = Flask(__name__)


@app.route("/")
def echo():
    final = str()
    final = final + "Version : {} | Hostname: {} | Port: {} | Datetime {}\n".format(
        __version__, socket.gethostname(), port, str(datetime.now())
    )

    if request.method == "POST":
        final = final + "You posted this, so, im echoing it back: {}".format(json.dumps(request.json, default=str))
    # elif request.method == 'GET':
    #     final = final + ""
    # print(final)

    return final


if __name__ == "__main__":
    port = os.getenv("FLASK_APP_PORT", "80")
    app.debug = True
    app.run(host="0.0.0.0", port=int(port))