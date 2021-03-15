FROM python:3.9.2-alpine3.13

WORKDIR /app
COPY . .
RUN pip install -e .
ENV FLASK_APP=js_example
EXPOSE 5000

CMD flask run --host=0.0.0.0
