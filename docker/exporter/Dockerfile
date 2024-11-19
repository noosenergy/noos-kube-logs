# https://hub.docker.com/r/fluent/fluentd/
# https://github.com/fluent/fluentd-docker-image/tree/master/v1.17
# https://github.com/fluent/fluentd-kubernetes-daemonset/tree/master/docker-image/v1.17

FROM fluent/fluentd:v1.17-debian

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
    # Incompatible API between json v2.7.4 and kubeclient v4.12.0
    # Upgraded alongside Fluentd v1.17.1 in:
    # https://github.com/fluent/fluentd-docker-image/pull/400
    && gem uninstall json \
    && gem install \
        json:2.7.2 \
        fluent-plugin-kubernetes_metadata_filter \
        fluent-plugin-multi-format-parser \
        fluent-plugin-concat \
        fluent-plugin-loggly \
        fluent-plugin-logzio \
        fluent-plugin-slack \
    && gem sources --clear-all \
    && rm -rf \
        /var/lib/apt/lists/* \
        /usr/lib/ruby/gems/*/cache/*.gem

# TODO: open issue on reading `/var/log` as non-root
# https://github.com/fluent/fluentd-kubernetes-daemonset/issues/548
# USER fluent
WORKDIR /home/fluent
