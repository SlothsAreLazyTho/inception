# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: cbijman <cbijman@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2023/11/13 16:11:44 by cbijman       #+#    #+#                  #
#    Updated: 2024/09/02 18:01:36 by cbijman       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

CXX=docker compose
CXX_FILE=-f ./srcs/docker-compose.yml

up: down build
	$(CXX) $(CXX_FILE) $@

down:
	$(CXX) $(CXX_FILE) $@

build:
	$(CXX) $(CXX_FILE) $@

.PHONY: up down build