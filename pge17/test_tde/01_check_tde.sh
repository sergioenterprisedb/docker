#!/bin/bash
export DOCKER_CLI_HINTS=off
docker exec -it pge psql -c "select * from pg_control_init()"