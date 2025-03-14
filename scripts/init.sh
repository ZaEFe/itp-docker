# #!/bin/sh

rm -rf volumes
mkdir -p volumes/{http,html,db}
mkdir -p volumes/http/config
mkdir -p volumes/db/{data,init}

docker run --rm --name temp-nginx -d nginx:alpine3.21

docker cp temp-nginx:/etc/nginx/conf.d volumes/http/config
docker cp temp-nginx:/etc/nginx/nginx.conf volumes/http/config

docker cp temp-nginx:/usr/share/nginx/html volumes

docker stop temp-nginx


cp templates/home-page.html volumes/html/index.html
cp templates/php-nginx-default.conf volumes/http/config/conf.d/default.conf
cp templates/init-todos-db.sql volumes/db/init/todos.sql
cp -r templates/todos-app volumes/html/todos
rm -rf volumes/html/php-info
cp -r templates/html-folder-for-php-info volumes/html/php-info


