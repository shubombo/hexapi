from flask import Flask, request, render_template, send_from_directory, abort, Blueprint
from .listenerhandler import process_post
import os

basedir = os.path.abspath(os.path.dirname(__file__))

listener = Blueprint('listener', __name__)

@listener.route("/", methods = ['POST', 'GET'])
def root():
    if request.method == 'POST':
        requestJson = request.get_json()
        try:
            process_post(requestJson[0])
        except Exception as e:
            return ('Error Handling Post Request')
        return 'Request Processed Successfully', 200
    if request.method == 'GET':
        return render_template('index.html'), 200

@listener.route("/<path:path>", methods = ['GET'])
def return_file(path):
    if os.path.isfile(os.path.join(basedir , 'log', path + '.txt')):
        return send_from_directory(os.path.join(basedir , 'log'), path + '.txt'), 200



@listener.route("/about", methods = ['GET'])
def about():
    return "Hello World", 200
