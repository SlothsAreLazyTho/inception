# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:11:44 by cbijman       #+#    #+#                  #
#    Updated: 2024/09/03 14:01:25 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

CXX=docker compose
CXX_FILE=-f ./srcs/docker-compose.yml
CXX_DATA=/home/cbijman/data

all: down build up

up:
	$(CXX) $(CXX_FILE) $@

down:
	$(CXX) $(CXX_FILE) $@ -v

build: $(CXX_DATA)
	$(CXX) $(CXX_FILE) $@

$(CXX_DATA):
	mkdir -p $(CXX_DATA)/wordpress $(CXX_DATA)/database

clean:
	rm -rf $(CXX_DATA)
	$(CXX) $(CXX_FILE) down -v
#	docker system prune -af

.PHONY: up down build clean