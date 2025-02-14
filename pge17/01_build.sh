#!/bin/bash
mkdir -p log
export TOKEN=`cat .token`
docker build --build-arg TOKEN=$TOKEN --no-cache -t pge:17.2 . 2>&1 | tee ./log/"build_$(date +%Y-%m-%d_%H-%M-%S).log"
