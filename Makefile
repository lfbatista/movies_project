THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: help build up start down destroy stop restart logs ps images migrate collectstatic
help:
	make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
build:
	docker-compose -f docker-compose.prod.yml build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` $(c)
up:
	docker-compose -f docker-compose.prod.yml up -d $(c)
start:
	docker-compose -f docker-compose.prod.yml start $(c)
down:
	docker-compose -f docker-compose.prod.yml down $(c)
destroy:
	docker-compose -f docker-compose.prod.yml down -v $(c)
stop:
	docker-compose -f docker-compose.prod.yml stop $(c)
restart:
	docker-compose -f docker-compose.prod.yml stop $(c)
	docker-compose -f docker-compose.prod.yml up -d $(c)
logs:
	docker-compose -f docker-compose.prod.yml logs --tail=100 -f $(c)
ps:
	docker-compose -f docker-compose.prod.yml ps
images:
	docker-compose -f docker-compose.prod.yml images
migrate:
	docker-compose -f docker-compose.prod.yml exec web python manage.py migrate
collectstatic:
	docker-compose -f docker-compose.prod.yml exec web python manage.py collectstatic --clear
createsuperuser:
	docker-compose -f docker-compose.prod.yml exec web python manage.py createsuperuser

