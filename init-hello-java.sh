#/bin/bash
docker container rm multi-build -f
docker image rm multi-build -f
docker build -t multi-build .
docker run -itd --name multi-build -d multi-build
docker container ls
docker logs multi-build
