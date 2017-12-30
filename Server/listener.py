from flask import Flask, request, send_from_directory
import listenerHandler
import config

PORT = config.PORT
app = Flask(__name__)

@app.route("/", methods = ['POST'])
def listener():
    if request.method == 'POST':
        try:
            requestJson = request.get_json()
            listenerHandler.process_post(requestJson)
        except Exception as e:
            return ('Error handling POST Request', 500)
    return 'Request Processed Successfully', 200

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=PORT, debug=True)
