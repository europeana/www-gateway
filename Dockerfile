FROM nginx:mainline

ENV PORT=80 \
    RESOLVER= \
    DISALLOW_ROBOTS=false \
    PORT_IN_REDIRECT=on \
    ANNOTATION_API_URL=https://annotations.europeana.eu \
    ANNOTATION_API_HOST=annotations.europeana.eu \
    ENTITY_API_URL=https://entity-api.europeana.eu \
    ENTITY_API_HOST=entity-api.europeana.eu \
    FULLTEXT_API_URL=https://fulltext.eanadev.org \
    FULLTEXT_API_HOST=fulltext.eanadev.org \
    PORTAL_URL=https://portaljs.europeana.eu \
    PORTAL_HOST=portaljs.europeana.eu \
    RECORD_API_URL=https://search-api.europeana.eu \
    RECORD_API_HOST=search-api.europeana.eu \
    SITEMAP_API_URL=https://sitemap.eanadev.org \
    SITEMAP_API_HOST=sitemap.eanadev.org \
    THUMBNAIL_API_URL=https://thumbnail.eanadev.org \
    THUMBNAIL_API_HOST=thumbnail.eanadev.org

RUN mv /docker-entrypoint.sh /docker-entrypoint-nginx.sh && \
    rm -r /usr/share/nginx/html

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY nginx /etc/nginx
COPY html /usr/share/nginx/html
