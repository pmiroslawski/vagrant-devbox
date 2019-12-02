# Vagrant DEV Box

Vagrantfile & provisioning script which configure base devbox for php7.2 environment. The box uses Ubuntu 18.04.2 LTS (Bionic Beaver) linux distribution as a base system.

Tools available in the box:
- apache 2.4
- php7.4 (with phpdbg, uopz, apcu, memcached, mongodb, redis, ssh2 extensions)
- mariadb 10.4
- mongodb 
- redis
- memcached
- rabbitmq (with rabbitmq_management plugin)
- git & git-flow 
- composer
- phpmd
- elasticsearch 7

## Getting Started

1. By default Vagrantfile does three things:
  - mounts your local directory ~/Projects into the guest /vagrant directory (NFS mount)  
  - copy ssh key(s) from host machine
  - copy .gitconfig file from host machine

  Prepare file in about paths or edit Vagrantfile, on the bottom of the file if you want to change anything.

2. Set a default mysql root password in provision.sh file

3. Run a command:

```
# vagrant up
```

4. Go to make a coffee

5. Done. You can log into your vagrant machine:
```
# vagrant ssh
```


