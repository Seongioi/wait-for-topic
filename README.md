# Wait for topic

This image waits for a list of Kafka topics to be created and exits afterwards.

Configure using environments variables:

| Name         	| Description                  	| Default 	|
|--------------	|------------------------------	|---------	|
| ATTEMPTS     	| Number of attempts to try    	| 7       	|
| KAFKA_BROKER 	| Kafka broker                 	|         	|
| TOPICS       	| Topic names separated by `:` 	|         	|