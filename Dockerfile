FROM python:latest
COPY . /app
WORKDIR /app
RUN pip install pipenv
RUN pipenv install
ENTRYPOINT ["python"]
CMD ["app.py"]
