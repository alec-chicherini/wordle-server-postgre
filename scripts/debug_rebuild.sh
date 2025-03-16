#!/bin/bash
docker stack rm wordle-server-postgre-stack
docker volume rm wordle-server-postgre-stack_pg_data
git pull
docker build --target=wordle_server_postgre_build . -t wordle-server-postgre-build
docker stack deploy --compose-file docker-compose.yml wordle-server-postgre-stack