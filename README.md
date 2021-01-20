# Europeana WWW gateway

![test](https://github.com/europeana/www-gateway/workflows/test/badge.svg)

HTTP gateway for www.europeana.eu using NGINX.

## Tests

Tests are written using [Postman](https://www.postman.com/).

## During development

1. Build and run with Docker:
    ```
    docker build -t europeana/www-gateway .
    docker run -d -p 80:80 --name europeana-www-gateway --rm europeana/www-gateway
    ```
2. Test:
    Open the collection file test/postman_collection.json in Postman and run
    with environment:
    * ORIGIN: http://localhost.

## Fully automated, e.g. during CI tests

Requires Docker Compose

```
docker-compose -f test/docker-compose.yml run test
```

## License

Licensed under the EUPL v1.2.

For full details, see [LICENSE.md](LICENSE.md).
