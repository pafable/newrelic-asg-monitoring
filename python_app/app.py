from myapp import models, app
import os
import setup

print(os.getcwd())
print(os.listdir())
print(os.listdir('myapp'))

if __name__ == "__main__":
    app.run(debug=False, threaded=True)