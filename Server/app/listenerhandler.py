"""
    Handler Script used to process and write the POST request
    to the appropriate txt file
"""

import os

basedir = os.path.abspath(os.path.dirname(__file__))

#  Process Request to appropriate folder
def process_post(requestJson):
    try:
    #  Check that the MessageType Key exists, if not pass default
        try:
            messageType = requestJson['MessageType']
        except KeyError as e:
            messageType = 'Output'
    #  Check that MessageType Value Exists, If not pass default
        try:
            output = {
                'Auction' : 'auction.txt'
            ,   'Tournament' : 'tournament.txt'
            ,   'Output' : 'apioutput.txt'
            }[messageType]
        except KeyError as e:
            output = 'apioutput.txt'
            write_post(requestJson, output)
    except Exception as e:
        return("Unable to process Post Request", requestJson)

# Write to corresponding txt file
def write_post(requestJson, output):
    with open((os.path.join(basedir , 'log', output)), 'a') as f:
        f.write("%s\n"%requestJson)
