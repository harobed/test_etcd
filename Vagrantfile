# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.define "etcd0" do |config|
    config.vm.box = "kaorimatz/debian-8.6-amd64"
    config.vm.hostname = "etcd0"
    config.vm.network "private_network", ip: '172.28.128.20'
    config.vm.synced_folder "src/etcd0/", "/root/"
  end
  config.vm.define "etcd1" do |config|
    config.vm.box = "kaorimatz/debian-8.6-amd64"
    config.vm.hostname = "etcd1"
    config.vm.network "private_network", ip: '172.28.128.21'
    config.vm.synced_folder "src/etcd1/", "/root/"
  end
  config.vm.define "etcd2" do |config|
    config.vm.box = "kaorimatz/debian-8.6-amd64"
    config.vm.hostname = "etcd2"
    config.vm.network "private_network", ip: '172.28.128.22'
    config.vm.synced_folder "src/etcd2/", "/root/"
  end
  config.vm.define "etcdctl" do |config|
    config.vm.box = "kaorimatz/debian-8.6-amd64"
    config.vm.hostname = "etcdctl"
    config.vm.network "private_network", ip: '172.28.128.23'
    config.vm.synced_folder "src/etcdctl/", "/root/"
  end
end
