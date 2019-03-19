FROM python:3.7-alpine

# necessary for pillow install? (zlib-dev is at least)
RUN apk update && \ 
apk add build-base python-dev py-pip jpeg-dev zlib-dev

WORKDIR /web/doggo-site/

COPY requirements.txt requirements.txt
RUN python -m venv venv

# Necessary for pillow install
RUN LIBRARY_PATH=/lib:/usr/lib /bin/sh -c "venv/bin/pip install -r requirements.txt"
RUN venv/bin/pip install gunicorn pymysql

COPY . .
RUN chmod a+x boot.sh

ENV FLASK_APP app.py

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
