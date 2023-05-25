FROM python:3.11-slim-buster as build
# 当前的稳定版
RUN apt-get update
RUN apt-get install -y --no-install-recommends gcc

WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.10-slim
WORKDIR /usr/app/venv
COPY --from=build /usr/app/venv ./venv
COPY . .

ENV PATH="/usr/app/venv/bin:$PATH"
CMD [ "python", "server.py" ]

