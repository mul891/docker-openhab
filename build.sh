#!/bin/bash

IMAGE=openhab

CWD=`cd $(dirname $0); pwd`

docker build -t $IMAGE $CWD

