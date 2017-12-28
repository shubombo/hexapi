import http.server
import json

class HexHandler(http.server.SimpleHTTPRequestHandler):
    def handle_request(self):
        try:
            self.send_response(200)
            self.end_headers()
            return
        except IOError:
            self.send_error(404,'File Not Found: %s' % self.path)

    def do_POST(self):
        self.handle_request()
        content_len = int(self.headers['content-length'], 0)
        post_value = self.rfile.read(content_len)
        post_body = json.loads(post_value.decode("utf-8"))
        #  Used for testing to output directly to a text file
        f = open('log\\apioutput.txt', 'a')
        f.write("%s\n"%post_body)
        f.close()
