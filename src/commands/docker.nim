import sugar
import tables
import strformat
import strutils
import fab
import docopt



let dockerFile = () => writeFile(
"Dockerfile",
"""
FROM nimlang/nim:onbuild
RUN rm /etc/nginx/conf.d/*
COPY src/nginx/proxy.conf /etc/nginx/conf.d/
ENTRYPOINT ["./bin/app"]
"""
)


let dockerCompose = () => writeFile(
"docker-compose.yml",
"""
version: '3.7'
services:
  web:
    image: nginx:latest
    build: .
    depends_on:
      - db
    ports:
      - "80:80"
      - "443:443"
    restart: always
  db:
    image: postgres
    environment:
      POSTGRES_DB=dbname:
      POSTGRES_USER=username:
      POSTGRES_PASSWORD=password:
    volumes:
      - ./pgdata:/var/lib/postgresql/data
    ports:
      - '5432:5432'
"""
)

proc genDocker*() =
  dockerFile()
  dockerCompose()
