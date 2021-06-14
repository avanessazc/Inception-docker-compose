# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayzapata <ayzapata@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/22 13:53:20 by ayzapata          #+#    #+#              #
#    Updated: 2021/06/04 12:38:21 by ayzapata         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = /home/user42/Bureau/inception/srcs
HOME = /home
USER = /ayzapata

RET = $(shell docker ps -a -q)

all:	up

build:	# Build the images
		@cd $(SRCS) && docker-compose build

up: 	
		@service nginx stop
		@service mysql stop
		@cd $(SRCS) && docker-compose up -d

down: 	
		@cd $(SRCS) && docker-compose down

prune:  down
		@docker system prune -af

stop_containers:	
ifneq "$(RET)" "0"
	@echo "There are not containers running"
else
	@docker stop $(RET)
endif

del_containers: stop_containers	
ifneq "$(RET)" "0"
	@echo "There are not containers to delete"
else
	@docker rm $(RET)
endif

del_images: stop_containers
		@docker image prune -f
		
fclean: del_containers del_images prune 


del_volumes: 
		@rm -rf $(HOME)$(USER)

re: fclean all

.PHONY: re, build, up, down, prune, stop_containers, del_images, del_containers, del_volumes, fclean
