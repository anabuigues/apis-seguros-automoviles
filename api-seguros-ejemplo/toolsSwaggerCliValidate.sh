#!/usr/bin/env sh

PWD=$(pwd)

docker run --rm \
--name apitools \
-v ${PWD}:/apis \
apitools:0.1.0 swagger-cli validate /apis/index.yml