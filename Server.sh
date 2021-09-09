apt update 
apt upgrade 


apt install -y nginx mysql-server php-fpm php-mysql zsh git curl powerline fonts-powerline php-mbstring php-xml apt-transport-https ca-certificates  gnupg lsb-release

if ! type "nodejs" > /dev/null; then
	apt -y install nodejs npm
fi


ufw allow 'Nginx HTTP'

EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi
php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
mv composer.phar /usr/local/bin/composer
exit $RESULT
