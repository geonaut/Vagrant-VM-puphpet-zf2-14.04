Vagrant-VM-puphpet-zf2-14.04
============================

This VM is intended to allow the rapid deployment of the Zend Framework 2 Skeleton App and a Foundation 5 template, for use as a learning environment.

It is not intended for use in a Production envrionment

## Requirements

* Vagrant
* VBox

## Resources used

* Basebox and LAMP configuration from http://puphpet.com
* RVM / Vagrant integration following: https://rvm.io/integration/vagrant

## VM includes / uses

* PHP 5.5 with xDebug
* MariaDB
* Apache2 with 2 vhosts
* Ruby 2.1.2 Multiuser
* RVM (stable)
* Node.js (stable)
* n (stable)
* npm (stable)
* Bower & Grunt (stable)
* Bazaar
* Foundation 5
* Compass
* Composer

## Initial Setup

* Clone to your local system
* Navigate in to the folder, using terminal
* Type: ``` vagrant up ```
* Once the VM is built type: ``` vagrant ssh ```
* Once logged in to the fresh VM, type:
```
cd /vagrant
sh setup-sites.sh
```
* type ``` gem update ```

This should deliver a fresh copy of the Zend Skeleton App and a fresh copy of a Foundation 5 template

## Accessing the sites

* Edit your local hosts file (not on the VM), adding:
```
192.168.56.101 foundation-test.local
192.168.56.101  zend-app.local
```

Sites should be available at http://foundation-test.local and http://zend-app.local

## Using Grunt

* Navigate to /vagrant/foundation-test.local/
* Type ``` grunt watch ```

## Notes

* When you destroy the vm (vagrant destroy), the zend-app.local and foundation-test.local folders will persist. To get a fully clean copy of these, uncomment the 'rm' lines in setup-sites.sh
* Further vhosts can be added by copying and editing the vhost code in config.yaml
* On login as the vagrant user, you can update installed gems by running 'gem update'
* If you are using livereload, add ``` options: { livereload: true, }, ``` under ``` watch: { ``` in \vagrant\foundation-test.local\gruntfile.js
