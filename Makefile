# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:11:44 by cbijman       #+#    #+#                  #
#    Updated: 2023/11/13 16:11:45 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

up: down build
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

.PHONY: up down build