from myapp.models import User, create_db, create_admin
import os

x = os.listdir('myapp')
if x.__len__() < 10:
    create_db()

y = User.query.all()
if y.__len__() == 0:
    create_admin('admin', 'admin', 'admin@example.test')