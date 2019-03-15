FROM python:3.7-slim
COPY . /app
WORKDIR /app
RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential
RUN pip install pipenv
RUN pipenv install

COPY nginx.conf /etc/nginx
RUN chmod +x ./start.sh
CMD ["./start.sh"]

ENTRYPOINT ["python"]
CMD ["app.py"]
