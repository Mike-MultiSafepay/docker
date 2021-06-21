rm -rf /var/www/html
git clone https://github.com/shopware/development.git -q -b v6.4.0.0  --depth=1 /var/www/html
cd /var/www/html
php ./psh.phar install --DB_HOST="db" --DB_USER="root" --DB_PASSWORD="example" --APP_URL="http://localhost" --DB_NAME="shopware"

/usr/local/bin/docker-php-entrypoint

tail -f /dev/null

#php -s
#php -a

