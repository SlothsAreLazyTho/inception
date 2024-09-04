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

all: up

up: build
	$(CXX) $(CXX_FILE) $@

down:
	$(CXX) $(CXX_FILE) $@

build: $(CXX_DATA)
	$(CXX) $(CXX_FILE) $@

$(CXX_DATA):
	mkdir -p $(CXX_DATA)/wordpress $(CXX_DATA)/database

clean: down
	rm -rf $(CXX_DATA)
	$(CXX) $(CXX_FILE) down -v

fclean: clean
	docker system prune -af

re: clean all

.PHONY: up down build clean fclean re