# 8.0.3 or 5.7.9 or 5.6.37
VERSION=8.0.3 
setup:
	sudo apt install make
	sudo mkdir -p /var/lib/docker_mysql/
	sudo mkdir -p /var/lib/docker_mysql/$(VERSION)

build:
	sudo bin/docker-compose build

up:
	sudo bin/docker-compose up -d

down:
	sudo bin/docker-compose down

logs:
	sudo bin/docker-compose logs -f

port:
	sudo bin/docker-compose port all

conn:
	mysql -h 127.0.0.1 -P 13380 -u root -ppass

clean:
	sudo bin/docker-compose stop
	sudo bin/docker-compose rm
	sudo rm -rf /var/lib/docker_mysql/$(VERSION)

test/redis:
	echo "SET tsuchida sugukonai" | redis-cli -p 16304
	echo "GET tsuchida" | redis-cli -p 16304


_install/redis-cli:
	sudo apt-get install redis-tools

