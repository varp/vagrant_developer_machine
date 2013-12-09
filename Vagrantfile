# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
ENV['DEVELOPER_MACHINE_ROOT'] = Dir.getwd
ENV['DEVELOPER_MACHINE_PROVISION_BOOTSTRAP'] = 'vagrant_machine.sh'


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.provision "shell", path: "#{File.join(ENV['DEVELOPER_MACHINE_ROOT'], ENV['DEVELOPER_MACHINE_PROVISION_BOOTSTRAP'])}"
  config.ssh.pty = true
  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  # config.ssh.forward_agent = true
  # config.vm.synced_folder ".", "/vagrant"
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--name", "developer-pc"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--acpi", "on"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ['modifyvm', :id, "--cpus", "4"]
    vb.customize ['modifyvm', :id, "--vram", "64"]
    vb.customize ['modifyvm', :id, "--accelerate3d", "on"]
    vb.customize ['modifyvm', :id, "--cpuexecutioncap", "50"]
  end
end