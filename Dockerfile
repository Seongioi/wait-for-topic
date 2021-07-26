FROM alpine:3.14

RUN apk  update && apk add kafkacat

COPY hold-for-topic.sh /
RUN chmod +x /hold-for-topic.sh
ENTRYPOINT ["sh", "/hold-for-topic.sh"]