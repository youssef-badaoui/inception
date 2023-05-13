all: build up
re : clean all
build:
    mkdir -p /home/ybadaoui/data/v1
    mkdir -p /home/ybadaoui/data/v2
    docker compose -f srcs/docker-compose.yml build
restart:
    docker compose -f srcs/docker-compose.yml restart
up:
    docker compose -f srcs/docker-compose.yml up 
down:
    docker compose -f srcs/docker-compose.yml down
clean: delete_volumes
    docker compose -f srcs/docker-compose.yml down --rmi all
delete_volumes:
    rm -rf /home/ybadaoui/data/v1
    rm -rf /home/ybadaoui/data/v2