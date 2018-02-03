"""
    Handler Script used to process and write the POST request
    to the appropriate txt file
"""

import os
from . import db
from .models import AuctionEvent, AuctionMessage, TournamentMessage, TournamentGame, TournamentMatch, TournamentDeck

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
        if messageType == 'Auction':
            try:
                process_auction(requestJson)
            except Exception as e:
                return("Unable to process Auction Post Request", requestJson)
        # if messageType == 'Tournament':
        #     try:
        #         print("Got Here")
        #         process_tournament(requestJson)
        #     except Exception as e:
        #         return("Unable to process Tournament Post Request", requestJson)
    except Exception as e:
        return("Unable to process Post Request", requestJson)

# Write to corresponding txt file
def write_post(requestJson, output):
    with open((os.path.join(basedir , 'log', output)), 'a') as f:
        f.write("%s\n"%requestJson)

def process_auction(requestJson):
    try:
        auctionMessage = AuctionMessage(
             MessageId = requestJson['MessageId'],
             MessageType = requestJson['MessageType'],
             MessageTime = requestJson['MessageTime']
        )
        db.session.add(auctionMessage)
        db.session.commit()
    except Exception as e:
        return("Unable to write Auction Message to database", requestJson)
    for i in requestJson['Events']:
        try:
            auctionEvent = AuctionEvent(
                 AuctionEventId = 1,
                 AuctionId = i['AuctionId'],
                 Item = i['Item'],
                 GoldBuyout = i['GoldBuyout'],
                 Actor = i['Actor'],
                 PlatBuyout = i['PlatBuyout'],
                 Action = i['Action'],
                 GoldBid = i['GoldBid'],
                 PlatBid = i['PlatBid'],
                 MessageId = requestJson['MessageId']
            )
            db.session.add(auctionEvent)
            db.session.commit()
        except Exception as e:
            return("Unable to write Auction Message to Database", i)

def process_tournament(requestJson):
    try:
        print( requestJson['MessageId']),
        print( requestJson['MessageType']),
        print( requestJson['TournamentTime']),
        print( requestJson['TournamentId']),
        print( requestJson['TournamentType'])

        tournamentMessage = TournamentMessage(
             MessageId = requestJson['MessageId'],
             MessageType = requestJson['MessageType'],
             TournamentTime = requestJson['TournamentTime'],
             TournamentId = requestJson['TournamentId'],
             TournamentType = requestJson['TournamentType']
        )
        db.session.add(tournamentMessage)
        db.session.commit()
    except Exception as e:
        return("Unable to write Tournament Message to database", requestJson)
    # for i in requestJson['Games']:
    #     try:
    #         tournamentGame = TournamentGame(
    #              TournamentGameId = 1,
    #              TournamentId = requestJson['TournamentId'],
    #              Round = i['Round']
    #         )
    #         db.session.add(tournamentGame)
    #         db.session.commit()
    #     except Exception as e:
    #         return("Unable to write Tournament Game to Database", i)
    #     for j in i['Matches']:
    #         try:
    #             tournamentMatch = TournamentMatch(
    #                  TournamentMatchId = 1,
    #                  TournamentGameId = tournamentGame.TournamentGameId,
    #                  TournamentId = requestJson['TournamentId'],
    #                  PlayerOne = j['PlayerOne'],
    #                  PlayerTwo = j['PlayerTwo'],
    #                  PlayerOneWins = j['PlayerOneWins'],
    #                  PlayerTwoWins = j['PlayerTwoWins']
    #
    #             )
    #             db.session.add(tournamentMatch)
    #             db.session.commit()
    #         except Exception as e:
    #             return("Unable to write Tournament Match to Database", i)
