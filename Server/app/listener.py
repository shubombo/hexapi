from flask import Flask, request, render_template, send_from_directory, abort, Blueprint
from .listenerhandler import process_post

listener = Blueprint('listener', __name__)

@listener.route("/", methods = ['POST', 'GET'])
def root():
    if request.method == 'POST':
        try:
            requestJson = request.get_json()
            listenerHandler.process_post(requestJson)
            return 'Request Processed Successfully', 200
        except Exception as e:
            return ('Error handling POST Request', 500)
    if request.method == 'GET':
        return render_template('index.html'), 200

@listener.route("/<path:path>", methods = ['GET'])
def return_file(path):
    if os.path.isfile(os.path.join('log', path+'.t xt')):
        return send_from_directory('log', path+'.txt')
    abort(404)

@listener.route("/about", methods = ['GET'])
def about():
    return "Hello World", 200
