#!/bin/sh

# run web server
exec gunicorn -b 0.0.0.0:80  listener:app
