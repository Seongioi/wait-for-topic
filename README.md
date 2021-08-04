# Wait for topic

This image will wait for a list of Kafka topics to be created before exiting. [Docker Repo](https://hub.docker.com/r/seongiwang/wait-for-topic)

Configure using the following environment variables:

| Name         	| Description                  	| Default 	|
|--------------	|------------------------------	|---------	|
| ATTEMPTS     	| Number of attempts to try    	| 7       	|
| KAFKA_BROKER 	| Kafka broker                 	|         	|
| TOPICS       	| Topic names separated by `:` 	|         	|
