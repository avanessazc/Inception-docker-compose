# Inception
> Common core project at School 42 - Paris
>
> This project is an introduction to docker-compose

## Introduction
This project aims to broaden the knowledge of system administration by using Docker. Virtualizing several Docker images, creating them in a new personal virtual machine.

## General guidelines
You have to set up:
1. A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only
2. A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
3. A Docker container that contains MariaDB only without nginx.
4. A volume that contains your WordPress database.
5. A second volume that contains your WordPress website files.
6. A docker-network that establishes the connection between your containers.
7. Your containers have to restart in case of a crash.

## Content
`Makefile` contains the rules for launching the docker and docker-compose commands

`docker-compose.yml` file in srcs folder defining services, networks, and volumes for a Docker application.

`srcs/` All the files required for the configuration

## Diagram
Here is an example diagram of the expected result:

<img width="562" alt="diagram" src="https://github.com/avanessazc/Inception-docker-compose/blob/master/diagram.png">