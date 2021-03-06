import os

from flask import Flask, Blueprint
from config import config
from flask_sqlalchemy import SQLAlchemy

# Initialize Flask extensions
db = SQLAlchemy()

def create_app(config_name=None):
    if config_name is None:
        config_name = os.getenv('FLASK_CONFIG','development')
    app = Flask(__name__)
    app.config.from_object(config[config_name])

    # Initialize flask extensions
    db.init_app(app)


    # Register API routes
    from .listener import listener as listener_blueprint
    app.register_blueprint(listener_blueprint, template_folder = "templates")

    return app
