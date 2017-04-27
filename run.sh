#!/bin/bash
#This one runs in the docker container.
#Don't call me directly, call `make run`.

flask initdb
flask run -h 0.0.0.0
