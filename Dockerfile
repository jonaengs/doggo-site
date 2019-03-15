# source: https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xix-deployment-on-docker-containers
FROM python:3.7-alpine

RUN adduser -D doggo

WORKDIR /web/doggo_site/

RUN sudo apt install -y python-dev \
    && sudo apt install -y gunicorn

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn

COPY app app
COPY app.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP app.py

RUN chown -R app:doggo ./
USER doggo

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]