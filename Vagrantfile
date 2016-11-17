# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "sqlserver"

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest: 1433, host: 1433
  config.vm.network "forwarded_port", guest: 1434, host: 1434

  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "4024"
  end
  
  config.vm.provision "shell", path: "setup.sh"
end
