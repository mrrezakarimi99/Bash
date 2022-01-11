echo "apt update & upgrade..."
apt update 
apt -y upgrade 

echo "install necessary app ..!"

apt install -y nginx mysql-server php-fpm php-mysql git curl php-mbstring php-xml

echo "do you want install gnome-tweaks ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	apt install -y gnome-tweaks
fi

echo "do you want install tilix ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	apt install -y tilix
fi

echo "do you want install flameshot ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	apt install -y flameshot
fi

echo "do you want install persepolis ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	add-apt-repository -y ppa:persepolis/ppa
	apt update
	apt install -y persepolis
fi

echo "do you want install anydesk ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
	echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
	apt update
	apt install -y anydesk
fi

echo "do you want install chrome ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	apt update
	apt install -y ./google-chrome-stable_current_amd64.deb
fi

echo "do you want install node ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	apt install -y nodejs npm
fi

echo "do you want install telegram-desktop ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	snap install telegram-desktop
fi

echo "do you want install postman ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	snap install postman
fi

echo "do you want install bitwarden ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	snap install bitwarden
fi

echo "do you want install skype ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	snap install skype
fi

echo "do you want install termius-app ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	snap install termius-app
fi

echo "do you want install htop ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	snap install htop
fi

echo "do you want install phpstorm ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	snap install phpstorm --classic
fi

echo "do you want install code ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	snap install code --classic
fi

echo "do you want install composer ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	EXPECTED_CHECKSUM="$(wget -q -O - https://composer.github.io/installer.sig)"
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
	if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ];then
	    >&2 echo 'ERROR: Invalid installer checksum'
	    rm composer-setup.php
	fi
	php composer-setup.php --quiet
	RESULT=$?
	rm composer-setup.php
	mv composer.phar /usr/local/bin/composer
fi

echo "do you want install zsh ?(please type y OR n)"
read input
if [ "$input" = "yes" ] || [ "$input" = "y" ];then
	apt install -y powerline fonts-powerline zsh
	chsh -s /usr/local/bin/zsh root
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
	source ~/.zshrc
fi

echo "setup for UFW nginx "
ufw allow 'Nginx HTTP'


