#!/bin/sh

if [[ -z "${ATTEMPTS}" ]]; then
  MAX_RETRIES=7
else
  MAX_RETRIES=${ATTEMPTS}
fi

if [[ -z "${KAFKA_BROKER}" ]]; then
  echo "ERROR: Kafka broker not set"
  exit 1
fi

if [[ -z "${TOPICS}" ]]; then
  echo "ERROR: No topics set"
  exit 1
fi

TOPIC_ARR=$(echo $TOPICS | tr ':' ' ')
cur_tries=0
all_found=false

echo "Waiting for topics: $TOPIC_ARR"
until [ "$cur_tries" -gt "$MAX_RETRIES" ] || "$all_found"; do
  all_found=true
  for i in ${TOPICS//:/ }
  do
    if [[ -z $(kafkacat -b $KAFKA_BROKER -L  2> /dev/null | grep $i) ]]; then
      all_found=false
    fi
  done

  printf 'retrying...\n'
  sleep 3
  cur_tries=$((cur_tries+1))
done

if [ "$cur_tries" -lt "$MAX_RETRIES" ]; then
  echo 'OK'
else
  echo "ERROR: Timed out waiting for" $KAFKA_BROKER >&2
  exit 1
fi