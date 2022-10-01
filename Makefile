tex:
	docker-compose -f docker-compose.tex.yml up
	docker-compose -f docker-compose.tex.yml down

tex-down:
	docker-compose -f docker-compose.tex.yml down --remove-orphans

db-install:
	cp database/.env.example database/.env

db:
	docker-compose -f database/docker-compose.mysql.yml up
	docker-compose -f database/docker-compose.mysql.yml down

db-down:
	docker-compose -f database/docker-compose.mysql.yml down --remove-orphans
