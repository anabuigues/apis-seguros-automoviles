#!/usr/bin/env sh

# if ! command -v python3 &> /dev/null
# then
#     echo "python3 is needed. Please install python 3 before running the documentation server"
#     exit
# fi

# python3 localServer.py


#!/usr/bin/env sh

PWD=$(pwd)

echo "Server listening in http://localhost:8000"
docker run --rm \
--name apitools \
-v ${PWD}:/apis \
-p 8000:8000 \
-w /apis \
apitools:0.1.0 python3 localServer.py