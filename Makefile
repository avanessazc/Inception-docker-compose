# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ayzapata <ayzapata@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/22 13:53:20 by ayzapata          #+#    #+#              #
#    Updated: 2021/06/16 12:34:51 by ayzapata         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ./srcs

HOME = /home
USER = /ayzapata
DATA = /data
MYSQL_VOLUME = /mysqldata
WORDPRESS_VOLUME = /wordpress

RET = $(shell docker ps -qa)

all:	up

build:	
		@cd $(SRCS) && docker-compose build

up: 	
		@service nginx stop
		@service mysql stop
		@mkdir -p $(HOME)$(USER)$(DATA)$(MYSQL_VOLUME)
		@mkdir -p $(HOME)$(USER)$(DATA)$(WORDPRESS_VOLUME)
		@cd $(SRCS) && docker-compose up -d

down: 	
		@cd $(SRCS) && docker-compose down

prune:  down
		@docker system prune -af

stop_containers:	
ifneq "$(RET)" "0"
	@echo "There are no running containers"
else
	@docker stop $(RET)
endif

del_containers: stop_containers	
ifneq "$(RET)" "0"
	@echo "There are no containers to delete"
else
	@docker rm $(RET)
endif

del_images: stop_containers
		@docker image prune -f
		
fclean: del_containers del_images prune 

del_volumes_dir: 
		@rm -rf $(HOME)$(USER)

re: fclean all

.PHONY: re, build, up, down, prune, stop_containers, del_images, del_containers, del_volumes_dir, fclean
