FROM python:3.11-slim-buster as build
# 当前的稳定版
RUN apt-get update
RUN apt-get install -y --no-install-recommends gcc
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends ca-certificates curl
WORKDIR /app
RUN pip3 install akshare --upgrade

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python", "server.py" ]

