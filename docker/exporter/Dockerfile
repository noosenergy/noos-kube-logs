# https://hub.docker.com/r/fluent/fluentd/
# https://github.com/fluent/fluentd-docker-image/tree/master/v1.15
# https://github.com/fluent/fluentd-kubernetes-daemonset/tree/master/docker-image/v1.15

FROM fluent/fluentd:v1.16-debian

USER root

# Install apt & gem dependencies
# ------------------------------
ARG APT_DEPS=" \
    sudo make \
    gcc g++ \
    libc-dev \
    libffi-dev \
    net-tools \
    "
RUN apt-get update \
    && apt-get install -y --no-install-recommends $APT_DEPS \
    && gem install \
        fluent-plugin-kubernetes_metadata_filter \
        fluent-plugin-multi-format-parser \
        fluent-plugin-concat \
        fluent-plugin-loggly \
        fluent-plugin-slack \
    && gem sources --clear-all \
    && rm -rf \
        /var/lib/apt/lists/* \
        /usr/lib/ruby/gems/*/cache/*.gem

# TODO: open issue on reading `/var/log` as non-root
# https://github.com/fluent/fluentd-kubernetes-daemonset/issues/548
# USER fluent
WORKDIR /home/fluent
