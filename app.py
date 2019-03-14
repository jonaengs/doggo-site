import os

from flask import Flask, send_file
from DoggoFace.imagegen import generate_face

app = Flask(__name__)

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
IMG_PATH = os.path.join(BASE_DIR, 'doggo_site/DoggoFace/Outputs/face.png')


@app.route('/')
def get_image():
    generate_face()
    return send_file(IMG_PATH, mimetype='image/png')
