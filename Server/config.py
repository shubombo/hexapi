<<<<<<< HEAD
PORT = 80
=======
import os
from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))

dotenv_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), '.env')
if os.path.exists(dotenv_path):
    load_dotenv(dotenv_path)

class Config(object):
    DEBUG = os.environ.get('FLASK_DEBUG',
                           True)
    TESTING = os.environ.get('TESTING',
                             False)
    SECRET_KEY = os.environ.get('SECRET_KEY',
                                '51f52814-1171-11e6-a247-000ec6c2372c')
    IP = os.environ.get('IP',
                        '0.0.0.0')
    PORT = os.environ.get('PORT',
                          '5000')

# GET Database configuration from Environmental Variables
    DATABASE_URL = os.environ.get('DATABASE_URL',
                                  'localhost')
    DATABASE_NAME = os.environ.get('DATABASE_NAME',
                                   'test')
    DATABASE_USER = os.environ.get('DATABASE_USER')
    DATABASE_PASSWORD = os.environ.get('DATABASE_PASSWORD')

# Set SQLALchemy configuration
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_DATABASE_URI = 'postgresql://%s:%s@%s/%s' % (
        DATABASE_USER, DATABASE_PASSWORD, DATABASE_URL, DATABASE_NAME)
    SQLALCHEMY_COMMIT_ON_TEARDOWN = True

class DevelopmentConfig(Config):
    DEBUG = True

class DockerConfig(Config):
    DEBUG = True

class ProductionConfig(Config):
    DEBUG = False

class TestingConfig(Config):
    TESTING = True

config = {
    'development': DevelopmentConfig,
    'docker': DockerConfig,
    'production': ProductionConfig,
    'testing': TestingConfig
}
>>>>>>> flaskdev
