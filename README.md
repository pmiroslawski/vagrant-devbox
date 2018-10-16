# Vagarant DEV Box

Vagrantfile & provisioning script which configure base devbox for php7.2 environment. The box uses debian/sid linux distribution as a base system.

Tools available in the box:
- apache 2.4
- php7.2
- mariadb 10.2
- mongodb 
- redis
- git 
- composer
- uopz

## Getting Started

1. Edit Vagrantfile, on the bottom of the file you can uncomment few lines for:
  - copy ssh key(s) from host machine
  - copy .gitconfig file from host machine
  - copy whatever you want from host machine

2. Run a command:

...,
# vagrant up
....

3. Go to make a coffee



### Prerequisites

The Vagrantfile uses sshfs for sync folder. Great implementation of that you can find here:
https://github.com/dustymabe/vagrant-sshfs

To enable sshfs vagrant-plugin in your env just execute bellow command:

```
# vagrant plugin install vagrant-sshfs
```


