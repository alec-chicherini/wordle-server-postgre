# wordle-server-postgre

postgre сервер для сервисов проекта wordle.

Секреты
```
openssl rand -base64 32 | docker secret create postgres_admin_password -
openssl rand -base64 32 | docker secret create postgres_wordle_server_user_password -
```

postgres network
```
docker network create --scope=swarm --driver=bridge --subnet=192.168.0.0/16 postgres_network
```

Запустить
```
docker build --target=wordle_server_postgre_build . -t wordle-server-postgre-build
docker stack deploy --compose-file docker-compose.yml
```

Коннект для wordle-server-game
```
#export PGPASSWORD=$(cat $POSTGRES_WORDLE_SERVER_USER_PASSWORD_FILE)
#ENV WORDLE_SERVER_GAME_URL=postgres://wordle-server-game@192.168.0.2:5432/postgres-db-wordle
```