#!/bin/bash
#This script sets up a connection between our local DB and
# the app running in the docker contianer. It's called by the makefile
# when you call `make run` so no need to call it directly.
if ! ifconfig | grep 172.18.0.1; then
    echo "Please enter your admin password in order to setup a loopback IP address for database access. You only need to do this once before rebooting:"
    sudo ifconfig lo0 alias 172.18.0.1/24
    brew services restart postgresql
else
    echo "Already setup IP address for database. Skipping."
fi
