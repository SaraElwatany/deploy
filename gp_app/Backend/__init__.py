import os
from flask import Flask
from flask_socketio import SocketIO
from .base import db
from .routes import main
# from .my_tokens import SECRET_KEY, SQLALCHEMY_DATABASE_URI as URI

socketio = SocketIO(cors_allowed_origins='*')

def create_app():
    print('Loading Routes..... , Please Wait')
    app = Flask(__name__)

    app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
    app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('SQLALCHEMY_DATABASE_URI')

    db.init_app(app)
    socketio.init_app(app)  # Initialize SocketIO with the app

    app.register_blueprint(main)

    return app

if __name__ == '__main__':
    app = create_app()
    db.create_all(app=app) 
    socketio.run(app)
