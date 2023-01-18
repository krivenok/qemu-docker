#!/bin/bash

NAME="qemu"

# Try to kill existing container if any
docker rm $NAME 2>/dev/null

# Run it again
docker run -it --rm --name $NAME krivenok/qemu:`cat version.txt`
