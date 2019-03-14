import os

from flask import Flask, send_file

app = Flask(__name__)
from DoggoFace.imagegen import main

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
IMG_PATH = os.path.join(BASE_DIR, 'doggo_site/DoggoFace/Outputs/face.png')

@app.route('/')
def get_image():
    main()
    return send_file(IMG_PATH, mimetype='image/png')
