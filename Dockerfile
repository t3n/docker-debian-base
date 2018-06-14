FROM debian:stretch-slim

ENV DUMB_INIT_VERSION 1.2.1

COPY bin/ /usr/local/bin/

RUN set -x && \
    clean-install procps curl ca-certificates && \
    curl -sL https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -o /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init && \
    clean-uninstall curl ca-certificates

ENTRYPOINT ["/usr/local/bin/dumb-init"]
