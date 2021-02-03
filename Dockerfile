FROM nginx:mainline

ENV PORT=80 \
    RESOLVER= \
    DISALLOW_ROBOTS=false \
    PORT_IN_REDIRECT=on \
    API_GATEWAY_URL=https://api.europeana.eu \
    API_GATEWAY_HOST=api.europeana.eu \
    PORTAL_URL=https://portaljs.europeana.eu \
    PORTAL_HOST=portaljs.europeana.eu \
    SITEMAP_API_URL=https://sitemap.eanadev.org \
    SITEMAP_API_HOST=sitemap.eanadev.org

RUN mv /docker-entrypoint.sh /docker-entrypoint-nginx.sh && \
    rm -r /usr/share/nginx/html

COPY src .
