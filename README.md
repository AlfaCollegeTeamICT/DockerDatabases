# Databases in Docker
Lesmateriaal voor de lessen Databases

## Installatie

0. Installeer Docker Desktop
1. Unzip

- Maak een .env met secrets

2. `docker compose up -d`
3. Ga in een browser naar [http://127.0.0.1:8080](http://127.0.0.1:8080)
4. ...
5. Profit


## Voorbeeld .env

```.env
MYSQL_ROOT_PASSWORD=admin
MYSQL_DATABASE=sakila
MYSQL_USER=student
MYSQL_PASSWORD=student
PMA_PORT=8080%
```
