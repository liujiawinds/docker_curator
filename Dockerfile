FROM alpine:3.4
MAINTAINER LiuJia "jia.liu@maxent-inc.com"

RUN apk --update add python py-setuptools py-pip && \
    pip install elasticsearch-curator==4.2.1 && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*

COPY action.yml /etc/curator/action.yml

COPY curator.yml /root/.curator/curator.yml

COPY run.sh /run.sh

CMD /run.sh
