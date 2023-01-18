#!/bin/bash

docker build -t krivenok/qemu:`cat version.txt` $@ .
