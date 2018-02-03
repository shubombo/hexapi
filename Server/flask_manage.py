import os
from dotenv import load_dotenv
from app import create_app, db
from app.models import AuctionEvent, AuctionMessage, TournamentMessage, TournamentGame, TournamentMatch, TournamentDeck
from flask_migrate import Migrate, upgrade



dotenv_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), '.env')
if os.path.exists(dotenv_path):
    load_dotenv(dotenv_path)


app = create_app(os.getenv('FLASK_CONFIG'))



migrate = Migrate(app, db)

@app.cli.command()
def deploy():
    """Run deployment tasks."""
    # migrate database to latest revision
    upgrade()
