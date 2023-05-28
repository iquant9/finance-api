# finance-api
# deploy
```shell
docker build -t finance-api-latest .
docker run --name finance-api -p 8011:8011 -d finance-api-latest
```

Done.