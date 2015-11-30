#!/bin/bash

INSTANCE=openhab
IMAGE=openhab
CMD=/bin/bash

CWD=`cd $(dirname $0)/..; pwd`

docker run --net=host --memory-swap=0 --cpu-shares=2 --device=/dev/ttyACM0:/dev/ttyACM0 -d -p 8080:8080 -p 9001:9001 --name $INSTANCE -v $CWD/data:/data -v $CWD/etc/:/etc/openhab -v $CWD/log:/opt/openhab/logs $IMAGE

