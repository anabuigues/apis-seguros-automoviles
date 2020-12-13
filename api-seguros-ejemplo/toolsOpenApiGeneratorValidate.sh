#!/usr/bin/env sh

PWD=$(pwd)

docker run --rm \
--name apitools \
-v ${PWD}:/apis \
apitools:0.1.0 swagger-cli bundle /apis/index.yml -t yaml -o /apis/generated/index_all_in_one.yml


docker run --rm \
--name apitools \
-v ${PWD}:/apis \
apitools:0.1.0 openapi-generator validate -i /apis/generated/index_all_in_one.yml
