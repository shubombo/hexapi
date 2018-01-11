import os

basedir = os.path.abspath(os.path.dirname(__file__))


class Config(object):
    DEBUG = True
    TESTING = False
    SECRET_KEY = os.environ.get('SECRET_KEY',
                                '51f52814-1171-11e6-a247-000ec6c2372c')



class DevelopmentConfig(Config):
    DEBUG = True

class DockerConfig(Config):
    DEBUG = True

class ProductionConfig(Config):
    DEBUG = False

class TestingConfig(Config):
    Testing = True

config = {
    'development': DevelopmentConfig,
    'docker': DockerConfig,
    'production': ProductionConfig,
    'testing': TestingConfig
}
