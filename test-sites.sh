echo 'Downloading Zend Skeleton App'
cd /.
cd vagrant
rm -fr zend-app.local
curl -sS https://getcomposer.org/installer | php
sudo php composer.phar create-project --repository-url="http://packages.zendframework.com" zendframework/skeleton-application:dev-master /vagrant/zend-app.local/skeleton-application

echo 'Setting Up Foundation / Grunt Test Site'
rm -fr foundation-test.local
foundation new foundation-test.local --libsass
cd foundation-test.local
npm install grunt-sass grunt-contrib-watch
grunt build
