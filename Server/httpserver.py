import socketserver
import httphandler

def main():
    PORT = 3000
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
