#!/usr/bin/env bash

#Install PHP5 dependencies
sudo apt-get -y build-dep php5 
sudo apt-get install -y php5 php5-dev php-pear autoconf automake curl build-essential libxslt1-dev re2c libxml2 libxml2-dev php5-cli bison libbz2-dev libreadline-dev
#sudo apt-get install -y libfreetype6 libfreetype6-dev libpng12-0 libpng12-dev libjpeg-dev libjpeg8-dev libjpeg8  libgd-dev libgd3 libxpm4
sudo apt-get install -y libssl-dev openssl
#sudo apt-get install -y gettext libgettextpo-dev libgettextpo0
#sudo apt-get install -y libicu-dev
#sudo apt-get install -y libmhash-dev libmhash2
sudo apt-get install -y libmcrypt-dev libmcrypt4

#Install MYSQL dependencies
sudo apt-get install mysql-server mysql-client libmysqlclient-dev libmysqld-dev -y

#Install phpbrew
sudo curl -L -O https://raw.github.com/phpbrew/phpbrew/master/phpbrew
sudo chmod +x phpbrew
sudo mv phpbrew /usr/bin/phpbrew

#Apache 2 integration
sudo chmod 777 /usr/lib/apache2/modules
sudo chmod -R og+rw /etc/apache2

# Init Systemwide
sudo phpbrew init
sudo echo 'export PHPBREW_SET_PROMPT=1' >> ~/.bashrc
sudo echo 'source /home/vagrant/.phpbrew/bashrc' >> ~/.bashrc
#. ~/.bash_profile
sudo phpbrew install 5.3.18 +default +intl +dbs +mb +apxs2=/usr/bin/apxs2 +exif +gettext +iconv +mcrypt +openssl +pcre +phar +session +tokenizer +zlib
sudo phpbrew switch 5.3.18
sudo /etc/init.d/apache2 restart