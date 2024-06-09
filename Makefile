all: setup-volumes
	@docker compose -f ./srcs/docker-compose.yml up -d

setup-volumes:
	@if [ ! -d ./volumes/mysql ]; then \
		mkdir ./volumes/mysql && chmod -R 777 ./volumes/mysql; \
	fi
	@if [ ! -d ./volumes/wordpress ]; then \
		mkdir ./volumes/wordpress && chmod -R 777 ./volumes/wordpress; \
	fi
down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker system prune -af

fclean:
	@docker system prune -af
	rm -rf ./volumes

re: down all

PHONY: all down clean fclean re 
