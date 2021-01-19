FROM nginx:mainline

ENV ANNOTATION_API_HOST=annotations.europeana.eu
ENV ANNOTATION_API_PROTO=https

ENV ENTITY_API_HOST=entity-api.europeana.eu
ENV ENTITY_API_PROTO=https

ENV FULLTEXT_API_HOST=fulltext.eanadev.org
ENV FULLTEXT_API_PROTO=https

ENV PORTAL_HOST=portaljs.europeana.eu
ENV PORTAL_PROTO=https

ENV RECORD_API_HOST=search-api.europeana.eu
ENV RECORD_API_PROTO=https

ENV SITEMAP_API_HOST=sitemap.eanadev.org
ENV SITEMAP_API_PROTO=https

ENV THUMBNAIL_API_HOST=thumbnail.eanadev.org
ENV THUMBNAIL_API_PROTO=https

ENV RESOLVER=

RUN mv /docker-entrypoint.sh /docker-entrypoint-nginx.sh && \
    rm -r /usr/share/nginx/html

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY nginx /etc/nginx
COPY html /usr/share/nginx/html
