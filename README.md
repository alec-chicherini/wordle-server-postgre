# wordle-server-postgre

postgre сервер для сервисов проекта wordle.

Секреты
```
openssl rand -base64 32 | docker secret create postgres_admin_password -
openssl rand -base64 32 | docker secret create postgres_wordle_server_user_password -
```

postgres network
```
docker network create --scope=swarm --driver=overlay --internal --attachable postgres_network
```

Запустить
```
docker build --target=wordle_server_postgre_build . -t wordle-server-postgre-build
docker stack deploy --compose-file docker-compose.yml
```

connect url
```
#export PGPASSWORD=$(cat $POSTGRES_WORDLE_SERVER_USER_PASSWORD_FILE)
#ENV POSTGRES_URL=postgres://postgres@postgres-server:5432/postgres
#ENV WORDLE_SERVER_GAME_URL=postgres://wordle-server-game@postgres-server:5432/postgres-db-wordle
```