from app import db
from sqlalchemy.dialects.postgresql import JSON, BIGINT, UUID, DATE, TEXT
import datetime

class BaseModel(db.Model):
    __abstract__ = True


    def __init__(self, *args):
        super().__init__(*args)

    def __repr__(self):
        """Define a base way to print models"""
        return '%s(%s)' % (self.__class__.__name__, {
            column: value
            for column, value in self._to_dict().items()
        })

    def json(self):
        """
                Define a base way to jsonify models, dealing with datetime objects
        """
        return {
            column: value if not isinstance(value, datetime.date) else value.strftime('%Y-%m-%d')
            for column, value in self._to_dict().items()
        }

class AuctionMessage(db.Model):
    __tablename__ = 'AuctionMessages'

    MessageId = db.Column(UUID, primary_key=True, nullable=False)
    MessageType = db.Column(TEXT, nullable=False)
    MessageTime = db.Column(DATE, nullable=False)
    CreateDate  = db.Column(DATE, nullable=True)

    def __init__(self, MessageId, MessageType, MessageTime):
        self.MessageId = MessageId
        self.MessageType = MessageType
        self.MessageTime = MessageTime

class AuctionEvent(db.Model):
    __tablename__ = 'AuctionEvents'

    AuctionEventId = db.Column(BIGINT, primary_key=True, nullable=False)
    AuctionId = db.Column(BIGINT, nullable=False)
    Item = db.Column(UUID, nullable=False)
    GoldBuyout = db.Column(BIGINT, nullable=False)
    Actor = db.Column(BIGINT, nullable=False)
    PlatBuyout = db.Column(BIGINT, nullable=False)
    Action = db.Column(TEXT, nullable=False)
    GoldBid = db.Column(BIGINT, nullable=False)
    PlatBid = db.Column(BIGINT, nullable=False)
    CreateDate  = db.Column(DATE, nullable=True, onupdate=datetime.datetime.now())
    MessageId = db.Column(UUID, nullable=False)

    def __init__(self,  AuctionEventId, AuctionId, Item, GoldBuyout, Actor, PlatBuyout, Action, GoldBid, PlatBid, MessageId):
        self.AuctionId = AuctionId
        self.Item = Item
        self.GoldBuyout = GoldBuyout
        self.Actor = Actor
        self.PlatBuyout = PlatBuyout
        self.Action = Action
        self.GoldBid = GoldBid
        self.PlatBid = PlatBid
        self.MessageId = MessageId

class TournamentMessage(db.Model):
    __tablename__ = 'TournamentMessages'

    MessageId = db.Column(UUID, primary_key=True, nullable=False)
    MessageType = db.Column(TEXT, nullable=False)
    TournamentTime = db.Column(DATE, nullable=False)
    TournamentId = db.Column(BIGINT, nullable=False)
    TournamentType = db.Column(TEXT, nullable=False)
    CreateDate  = db.Column(DATE, nullable=True)

    def __init__(self, MessageId, MessageType, TournamentTime, TournamentId, TournamentType):
        self.MessageId = MessageId
        self.MessageType = MessageType
        self.TournamentTime = TournamentTime
        self.TournamentId = TournamentId
        self.TournamentType = TournamentType

class TournamentGame(db.Model):
    __tablename__ = 'TournamentGames'

    TournamentGameId = db.Column(BIGINT, primary_key=True, nullable=False)
    TournamentId = db.Column(UUID, nullable=False)
    Round = db.Column(BIGINT, nullable=False)
    CreateDate  = db.Column(DATE, nullable=True)

    def __init__(self, TournamentId, Round):
        self.TournamentId = TournamentId
        self.Round = Round

class TournamentMatch(db.Model):
    __tablename__ = 'TournamentMatches'

    TournamentMatchId = db.Column(BIGINT, primary_key=True, nullable=False)
    TournamentGameId = db.Column(BIGINT, nullable=False)
    TournamentId = db.Column(UUID, nullable=False)
    PlayerOne = db.Column(BIGINT, nullable=False)
    PlayerTwo = db.Column(BIGINT, nullable=False)
    PlayerOneWins = db.Column(BIGINT, nullable=False)
    PlayerTwoWins = db.Column(BIGINT, nullable=False)
    CreateDate  = db.Column(DATE, nullable=True)

    def __init__(self, TournamentGameId, TournamentId, PlayerOne, PlayerTwo, PlayerOneWins, PlayerTwoWins):
        self.TournamentGameId = TournamentGameId
        self.TournamentId = TournamentId
        self.PlayerOne = PlayerOne
        self.PlayerTwo = PlayerTwo
        self.PlayerOneWins = PlayerOneWins
        self.PlayerTwoWins = PlayerTwoWins

class TournamentDeck(db.Model):
    __tablename__ = 'TournamentDecks'

    TournamentDeckId = db.Column(BIGINT, primary_key=True, nullable=False)
    TournamentMatchId = db.Column(BIGINT, nullable=False)
    TournamentGameId = db.Column(BIGINT, nullable=False)
    TournamentId = db.Column(UUID, nullable=False)
    Player = db.Column(BIGINT, nullable=False)
    CreateDate  = db.Column(DATE, nullable=True)

    def __init__(self, TournamentMatch, TournamentGameId, TournamentId, Player, Champion, DeckId):
        self.TournamentMatchId = TournamentMatchId
        self.TournamentGameId = TournamentGameId
        self.TournamentId = TournamentId
        self.Player = Player
        self.DeckId = DeckId

class Deck(db.Model):
    __tablename__ = "Decks"

    DeckId = db.Column(BIGINT, primary_key=True, nullable=False)
    Champion = db.Column(UUID, nullable=False)
    CreateDate = db.Column(DATE, nullable=True)

    def __init__(self, Champion):
        self.Champion = Champion

class DeckMain(db.Model):
    __tablename__ = "DeckMains"

    DeckMainId = db.Column(BIGINT, primary_key=True, nullable=False)
    DeckId = db.Column(BIGINT, nullable=False)
    DeckMainJson = db.Column(JSON, nullable=False)
    CreateDate = db.Column(DATE, nullable=True)

    def __init__(self, DeckId, DeckMainJson):
        self.DeckId = DeckId
        self.DeckMainJson = DeckMainJson

class DeckSideBoard(db.Model):
    __tablename__ = "DeckSideBoards"

    DeckSideBoardId = db.Column(BIGINT, primary_key=True, nullable=False)
    DeckId = db.Column(BIGINT, nullable=False)
    DeckSideBoardJson = db.Column(JSON, nullable=False)
    CreateDate = db.Column(DATE, nullable=True)

    def __init__(self, DeckId, DeckSideBoardJson):
        self.DeckId = DeckId
        self.DeckSideBoardJson = DeckSideBoardJson
