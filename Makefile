YML = ./srcs/docker-compose.yml

VOL = ${HOME}/imoro-sa/

VOL_MYSQL = ${VOL}data/mysql/

VOL_WORDPRESS = ${VOL}data/wordpress/

all: setup-volumes
	@docker compose -f ${YML} up -d

setup-volumes:
	@if [ ! -d ${VOL_MYSQL} ]; then \
		mkdir -p ${VOL_MYSQL} && chmod -R 777 ${VOL_MYSQL}; \
	fi
	@if [ ! -d ${VOL_WORDPRESS} ]; then \
		mkdir -p ${VOL_WORDPRESS} && chmod -R 777 ${VOL_WORDPRESS}; \
	fi

down:
	@docker compose -f ${YML} down

clean:
	@docker system prune -af

fclean: down clean
	@docker volume rm $$(docker volume ls -q)
	@sudo rm -rf ${VOL}

re: down setup-volumes
	@docker compose -f ${YML} up --build -d

PHONY: all down clean fclean re
