# Europeana WWW gateway

![test](https://github.com/europeana/www-gateway/workflows/test/badge.svg)

NGINX HTTP gateway for www.europeana.eu as a Docker image.

The primary purpose of the WWW gateway is to serve the Europeana website
application, but it also handles various legacy URLs, including access to APIs
via www.europeana.eu/api.

## Usage

**Either** pull from Docker Hub:
```
docker pull europeana/www-gateway
```

**Or**, build from source:
```
docker build -t europeana/www-gateway .
```

Run:
```
docker run --name europeana-www-gateway -p 8080:80 -d europeana/www-gateway
```

The gateway is now accessible at http://localhost:8080.


## Configuration

Configuration settings are made available as environment variables on the Docker
image.

### General
* `PORT`: the TCP port on which to listen for HTTP requests; default 80
* `RESOLVER`: the address of DNS resolver(s) to use for upstream server hostname
  resolution; defaults to that in the container's /etc/resolv.conf at runtime
  via [docker-entrypoint.sh](./docker-entrypoint.sh)
* `DISALLOW_ROBOTS`: if "true", robots will be blocked from crawling site, via
  robots.txt; default "false"
* `PORT_IN_REDIRECT`: sets NGINX `port_in_redirect` to "on" or "off"; default
  "on" (preferred for development and testing); set to "off" for deployments
  where ports 80 and/or 443 are forwarded to the gateway by an external router,
  e.g. in Cloud Foundry

### Reverse proxy URLs and hosts

Each upstream service to which this gateway may reverse proxy has two configuration
settings: one for URL, and one for host.

The **URL** is the full URL with scheme, hostname and port to use in the proxied
requests, i.e. at which the server is accessible from the gateway, which may (or
may not) be on a private network not accessible to clients, such as when using
[Cloud Foundry container-to-container networking](https://docs.cloudfoundry.org/devguide/deploy-apps/cf-networking.html).
Examples: `https://api.europeana.eu`; `http://portal.apps.internal:8080`

The **host** is the hostname to send in the HTTP Host header of the proxied
request, which may (or may not) need to be a publicly accessible one, depending
on the upstream service.
Examples: `api.europeana.eu`; `portal.europeana.eu`

* `ANNOTATION_API_URL` & `ANNOTATION_API_HOST`: Annotation API
* `ENTITY_API_URL` & `ENTITY_API_HOST`: Entity API
* `FULLTEXT_API_URL` & `FULLTEXT_API_HOST`: Fulltext API
* `PORTAL_URL` & `PORTAL_HOST`: Portal website
* `RECORD_API_URL` & `RECORD_API_HOST`: Record API
* `SITEMAP_API_URL` & `SITEMAP_API_HOST`: Sitemap API
* `THUMBNAIL_API_URL` & `THUMBNAIL_API_HOST`: Thumbnail API


## Testing

Tests are written using [Postman](https://www.postman.com/).

The test suite is run on pull requests and pushes to the main branch via a
[GitHub Actions workflow](./.github/workflows/test.yml).

## During development

1. Build and run with Docker:
    ```
    docker build -t europeana/www-gateway .
    docker --name europeana-www-gateway run -e PORT=8080 -p 8080:8080 --rm europeana/www-gateway
    ```
2. Test:
    Open the collection file [test/postman_collection.json](./test/postman_collection.json)
    in Postman and run with environment:
    * ORIGIN: http://localhost:8080

## Fully automated

With convenience shell script:
```
test/run
```

With Docker Compose:
```
docker-compose -f test/docker-compose.yml down
docker-compose -f test/docker-compose.yml build
docker-compose -f test/docker-compose.yml run test
```


## TODO

* Deployment scripts for Cloud Foundry, with GitHub Actions, or Jenkins Pipeline
* In test suite Docker Compose, mock APIs and Portal to prevent requests to live
  services


## License

Licensed under the EUPL v1.2.

For full details, see [LICENSE.md](LICENSE.md).
