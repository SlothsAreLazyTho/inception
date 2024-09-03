# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:11:44 by cbijman       #+#    #+#                  #
#    Updated: 2024/09/03 13:17:03 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

CXX=docker compose
CXX_FILE=-f ./srcs/docker-compose.yml
CXX_DATA=./srcs/data

up: down build
	$(CXX) $(CXX_FILE) $@

down:
	$(CXX) $(CXX_FILE) $@

build: $(CXX_DATA)
	$(CXX) $(CXX_FILE) $@

$(CXX_DATA):
	mkdir -p $(CXX_DATA)/wordpress $(CXX_DATA)/database

clean:
	rm -rf $(CXX_DATA)

.PHONY: up down build clean