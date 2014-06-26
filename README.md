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

## Default programs included

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

## Housekeeping

* type ``` gem update ```

This should deliver a fresh copy of the Zend Skeleton App and a fresh copy of a Foundation 5 template

## Accessing / editing the test sites

* Edit your local hosts file (not on the VM), adding:
```
192.168.56.101  foundation-test.local
192.168.56.101  zend-app.local
```
* Sites should be available at http://foundation-test.local and http://zend-app.local
* Further vhosts can be added by copying and editing the vhost code in config.yaml
* If you are using livereload, add ``` options: { livereload: true, }, ``` under ``` watch: { ``` in \vagrant\foundation-test.local\gruntfile.js
* If you want to use Grunt, Navigate to eg /vagrant/foundation-test.local/ and type ``` grunt watch ```

## Optional features

### Desktop GUI

* To use the vbox GUI window, edit the vagrant file by putting ``` virtualbox.gui = true ``` somewhere under ``` config.vm.provider ``` - eg

      ```
      config.vm.provider :virtualbox do |virtualbox|
      virtualbox.gui = true
      data['vm']['provider']['virtualbox']['modifyvm'].each do |key, value|
      ```
* Then run ``` sh /vagrant/Housekeeping_&_Extras.sh ``` and enter y when prompted
* Once setup, restart the vm with ``` exit ``` then ``` vagrant halt ``` and ``` vagrant up ```. You should see the vbox GUI, followed by a standard desktop login prompt. Login as the user vagrant (default is no password).
* Type ``` sudo startxfce4& ```
* X should start up, and log you into your shiny new desktop

### VBox Guest Additions

* To keep on top of the guest additions, there is the VBGuest plugin. To use it, simply type vagrant ``` plugin install vagrant-vbguest ``` and the plugin should take care of the rest. You might need to update the version of the gust additions ISO in your vbox instance.

## Notes

* When you destroy the vm (vagrant destroy), the zend-app.local and foundation-test.local folders will persist. To get a fresh copy of these, uncomment the 'rm' lines in setup-sites.sh

* On login as the vagrant user, you can update installed gems by running 'gem update'
* 
