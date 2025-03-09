FROM ubuntu:24.04 AS wordle_server_postgre_build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y \
    postgresql-16 \
    postgresql-client-16

RUN createdb -U postgres postgres-db-wordle

RUN createuser -U postgres wordle-server-game -d postgres-db-wordle
RUN psql -U postgres -d postgres-db-wordle -a -f /wordle-server-postgre/security/users.sql
RUN psql -U postgres -d postgres-db-wordle -a -f /wordle-server-postgre/schemas/create_server_game_tables.sql
RUN psql -U postgres -d postgres-db-wordle -a -f /wordle-server-postgre/data/words.sql

RUN systemctl restart postgresql.service

ENTRYPOINT ["watch","-n","60","pg_isready -d postgres-db-wordle"]