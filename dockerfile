FROM sanicframework/sanic:3.8-latest

WORKDIR /sanic

COPY . .



RUN pip install  pandas
RUN pip install -r requirements.txt

EXPOSE 8011

CMD ["python", "server.py"]