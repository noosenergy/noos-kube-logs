# https://hub.docker.com/r/fluent/fluentd/
# https://github.com/fluent/fluentd-docker-image/blob/master/v0.12
# https://github.com/fluent/fluentd-kubernetes-daemonset/tree/master/docker-image/v0.12

FROM fluent/fluentd:v1.12-1

USER root

RUN set -ex \
    && apk upgrade --no-cache \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
        libffi-dev \
    && gem install \
        fluent-plugin-kubernetes_metadata_filter \
        fluent-plugin-rewrite-tag-filter \
        fluent-plugin-slack \
    && apk del .build-deps \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent
WORKDIR /home/fluent
ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
