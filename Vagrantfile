# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Networking
  config.vm.network  "private_network", ip: "192.168.56.222"
  config.vm.hostname = "jasper.kroon.dev"
  config.ssh.forward_agent = true

  config.vm.synced_folder "./", "/var/www", id: "vagrant-root", nfs: (RUBY_PLATFORM =~ /linux/ or RUBY_PLATFORM =~ /darwin/)

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :shell, :path => ".support/puppet/files/upgrade-puppet.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = ".support/puppet/manifests"
    puppet.module_path = ".support/puppet/modules"
    puppet.manifest_file  = "init.pp"
    puppet.facter = { 'fqdn' => config.vm.hostname }
  end
end
