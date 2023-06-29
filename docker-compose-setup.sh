#!/bin/bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo service docker start
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo touch docker-compose
sudo chmod 644 docker-compose
sudo tee -a docker-compose > /dev/null << EOT
version: '3.8'

services:

  mysql_db:
    container_name: mysql_container
    image: mysql/mysql-server:8.0.23
    restart: always
    environment: 
      MYSQL_ROOT_PASSWORD: qwerty123
      MYSQL_DATABASE: wordpress_db
      MYSQL_USER: wordpress_user
      MYSQL_PASSWORD: wordpress_user_password
    volumes:
      - mysql:/var/lib/mysql

  wordpress:
    depends_on:
      - mysql_db
    image: wordpress:latest
    restart: always
    ports:
      - "8000:80"
    environment:
      WORDPRESS_DB_HOST: mysql_db:3306
      WORDPRESS_DB_USER: wordpress_user
      WORDPRESS_DB_PASSWORD: wordpress_user_password
      WORDPRESS_DB_NAME: wordpress_db
    volumes:
      - "./:/var/www/html"

  phpmyadmin:
    depends_on:
      - mysql_db
    platform: linux/amd64
    image: phpmyadmin/phpmyadmin
    restart: always
    ports: 
      - 3333:80
    environment:
      PMA_HOST: mysql_db
      MYSQL_ROOT_PASSWORD: qwerty123
    volumes:
    - "./:/var/www/html/phpmyadmin"

volumes:
  mysql: {}
EOT
sudo mv docker-compose docker-compose.yaml
sudo docker-compose up -d