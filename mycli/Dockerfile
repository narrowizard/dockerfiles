FROM python:3.8

COPY . /app
RUN cd /app && pip install -e .
RUN apt update && apt install -y less

CMD mycli