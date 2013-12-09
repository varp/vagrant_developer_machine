# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'pathname'


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
DEVELOPER_MACHINE_PATH = Dir.new(__FILE__) && Dir.path
DEVELOPER_MACHINE_SCRIPT_NAME = 'vagrant_machine.sh'
DEVELOPER_MACHINE_PROVISION_BOOTSTRAP = Pathname.join(DEVELOPER_MACHINE_PATH, DEVELOPER_MACHINE_SCRIPT_NAME)


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.provision "shell", path: "#{DEVELOPER_MACHINE_PROVISION_BOOTSTRAP}"
  config.ssh.pty = true
  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  # config.ssh.forward_agent = true
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
end