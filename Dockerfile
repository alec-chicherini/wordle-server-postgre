# syntax=docker/dockerfile:1
FROM postgres:16.8 AS wordle_server_postgre_build

COPY ./scripts/init_server_game_bd.sh /docker-entrypoint-initdb.d/
COPY ./sqls/create_server_game_tables.sql /docker-entrypoint-initdb.d/
COPY ./sqls/words.sql /docker-entrypoint-initdb.d/
