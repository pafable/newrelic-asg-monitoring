from datetime import datetime
from myapp import db, bcrypt, login_manager
from flask_login import UserMixin

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

class User(db.Model, UserMixin):
    __tablename__ = 'user'
    id = db.Column('id', db.Integer, primary_key=True)
    # username = db.Column('username', db.String(20), unique=True, nullable=False)
    # email = db.Column('email', db.String(120), unique=True, nullable=False)
    username = db.Column('username', db.String(20), nullable=False)
    email = db.Column('email', db.String(120), nullable=False)  
    image_file = db.Column('image_file', db.String(20), nullable=False, default='default.jpg')
    password = db.Column('password', db.String(80), nullable=False)
    posts = db.relationship('Post', backref='author', lazy=True)

    def __repr__(self):
        return f"User('{self.username}', '{self.email}', '{self.image_file}')"


class Post(db.Model):
    __tablename__ = 'post'
    id = db.Column('id', db.Integer, primary_key=True)
    title = db.Column('title', db.String(100), nullable=False)
    date_posted = db.Column('date_posted', db.DateTime, nullable=False, default=datetime.utcnow)
    content = db.Column('content', db.Text, nullable=False)
    user_id = db.Column('user_id', db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return f"Post('{self.title}', '{self.date_posted}')"


def create_admin(pw, user, email):
    hashed_password = bcrypt.generate_password_hash(pw).decode('utf-8')
    admin = User(username=user, email=email, password=hashed_password)
    db.session.add(admin)
    db.session.commit()


def create_db():
    db.create_all()


if __name__ == '__main__':
    create_db('test', 'test', 'test@example.test')