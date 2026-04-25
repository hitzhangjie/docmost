.PHONY: docker-create docker-up docker-down docker-logs docker-deploy docker-clean

COMPOSE := docker compose

# 1) Rebuild images only, do not start containers.
docker-create:
	$(COMPOSE) build --no-cache

# 2) Start containers in daemon mode.
docker-up:
	$(COMPOSE) up -d

# 3) Stop and remove containers/network, keep volumes.
docker-down:
	$(COMPOSE) down

# 4) Show compose logs (follow mode).
docker-logs:
	$(COMPOSE) logs -f

# 5) Rebuild images and restart containers.
docker-deploy:
	$(COMPOSE) up -d --build --force-recreate

# 6) Stop containers and remove project images + volumes.
docker-clean:
	$(COMPOSE) down --rmi all -v --remove-orphans
