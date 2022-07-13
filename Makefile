SHELL = /bin/bash

.DEFAULT_GOAL := help

.PHONY: setup-profiles
setup-profiles: ## 1.-Setting up the profiles
	@ echo "**********Setting up the profiles.yml**********"
	mkdir -p ~/.dbt
	touch ~/.dbt/profiles.yml
	open ~/.dbt/profiles.yml

.PHONY: start
start: ## 2.-Use docker-compose to create container
	@ echo "**********Building container**********"
	docker-compose up --build --remove-orphans -d

.PHONY: dbt
dbt: ## 3.-Jump inside of docker container with dbt installed
	@ echo "**********SSH docker container**********"
	docker exec -it agent_snowflake /bin/bash

.PHONY: clean
clean: ## 4.-Clean containers from docker-compose
	@ echo "**********Cleaning container**********"
	docker-compose down -v

help: ## 5.-Display all the different target recipes
	@ echo "Please use \`make <target>' where <target> is one of"
	@ perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'
