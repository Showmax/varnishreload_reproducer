# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian9"
  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.synced_folder ".", "/vagrant"
end
