FROM python:3.7-alpine

RUN apk add build-base python-dev py-pip jpeg-dev zlib-dev
# stop crash when installing pillow
# ENV LIBRARY_PATH=/lib:/usr/lib

RUN adduser -D microblog

WORKDIR /home/microblog

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN LIBRARY_PATH=/lib:/usr/lib /bin/sh -c "venv/bin/pip install install -r requirements.txt"
RUN venv/bin/pip install gunicorn pymysql

COPY app.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP app.py

RUN chown -R microblog:microblog ./
USER microblog

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]