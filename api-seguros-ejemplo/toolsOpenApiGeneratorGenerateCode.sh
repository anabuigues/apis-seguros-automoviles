#!/usr/bin/env sh

PWD=$(pwd)

docker run --rm \
--name apitools \
-v ${PWD}:/apis \
apitools:0.1.0 swagger-cli bundle /apis/index.yml -t yaml -o /apis/generated/index_all_in_one.yml

echo "Generating csharp client"
rm -rf generated/csharp-client
docker run --rm \
--name apitools \
-v ${PWD}:/apis \
apitools:0.1.0 openapi-generator generate -i /apis/generated/index_all_in_one.yml -g csharp --git-user-id GitUser --git-repo-id GitRepo -o /apis/generated/csharp-client


echo "Generating aspnet server"
rm -rf generated/aspnet-server
docker run --rm \
--name apitools \
-v ${PWD}:/apis \
apitools:0.1.0 openapi-generator generate -i /apis/generated/index_all_in_one.yml -g aspnetcore --git-user-id GitUser --git-repo-id GitRepo --config /apis/openapi-generator-aspnetcore-config.json -o /apis/generated/aspnet-server
