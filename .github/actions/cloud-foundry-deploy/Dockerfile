# Docker image for deploying to Cloud Foundry

FROM debian:buster-slim

# Install CF CLI & plugins
RUN apt-get -q update && apt-get -yq install apt-transport-https gnupg wget \
    && wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - \
    && echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list \
    && apt-get -q update && apt-get -yq install cf7-cli \
    && rm -rf /var/lib/apt/lists/* \
    && cf install-plugin app-autoscaler-plugin -f -r CF-Community

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/docker-entrypoint.sh"]
