up: down build
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

.PHONY: up down build