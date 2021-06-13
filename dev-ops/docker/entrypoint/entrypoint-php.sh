git clone https://github.com/shopware/development.git -q -b v6.4.1.0  --depth=1 /var/www/html
cd /var/www/html
./psh.phar install --DB_HOST="db" --DB_USER="root" --DB_PASSWORD="example" --APP_URL="http://localhost" --DB_NAME="shopware"
#    entrypoint: sh /entrypoint/entrypoint-php.sh




docker-php-entrypoint

#nginx -g 'daemon off;'