FROM debian:bullseye-slim

ENV DUMB_INIT_VERSION 1.2.5

COPY bin/ /usr/local/bin/

RUN set -x && \
    clean-install \
        ca-certificates \
        curl \
        procps && \
    curl -sL https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_x86_64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init && \
    clean-uninstall curl

ENTRYPOINT ["/usr/local/bin/dumb-init"]
