from flask import Flask, request, render_template, send_from_directory, abort
import listenerHandler
import config
import os

# Declare Flask app
app = Flask(__name__)
config_name = os.environ.get('FLASK_CONFIG', 'development')
app.config.from_object(getattr(config, config_name.title() + 'Config'))


@app.route("/", methods = ['POST', 'GET'])
def listener():
    if request.method == 'POST':
        try:
            requestJson = request.get_json()
            listenerHandler.process_post(requestJson)
            return 'Request Processed Successfully', 200
        except Exception as e:
            return ('Error handling POST Request', 500)
    if request.method == 'GET':
        return render_template('index.html'), 200
@app.route("/<path:path>", methods = ['GET'])
def return_file(path):
    if os.path.isfile(os.path.join('log', path+'.txt')):
        return send_from_directory('log', path+'.txt')
    abort(404)

if __name__ == "__main__":
    app.run()
