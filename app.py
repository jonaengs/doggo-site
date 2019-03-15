import os
from io import BytesIO
from flask import Flask, send_file
from DoggoFace.imagegen import generate_face

app = Flask(__name__)

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
IMG_PATH = os.path.join(BASE_DIR, 'doggo_site/DoggoFace/Outputs/face.png')


def serve_pil_image(pil_img):
    img_io = BytesIO()
    pil_img.save(img_io, 'PNG', quality=70)
    img_io.seek(0)
    return send_file(img_io, mimetype='image/png')


@app.route('/')
def get_image():
    doggo_face = generate_face()
    return serve_pil_image(doggo_face)
