#! /usr/bin/Python

import socketserver
import httphandler
import config

def main():
    PORT = config.PORT
    Handler = httphandler.HexHandler
    try:
        server = socketserver.TCPServer(('', PORT), Handler)
        print ('started httpserver on port %s...'%PORT)
        server.serve_forever()
    except KeyboardInterrupt:
        print ('received, shutting down server')
        server.socket.close()

if __name__ == '__main__':
    main()
