# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm;box_url = 'debian/buster64'
  config.vm.box_check_update = false

  config.vm.define 'server' do |machine|
    machine.vm.hostname = 'server'
    machine.vm.network 'private_network', ip: '192.168.50.10'
    machine.vm.provider 'virtualbox' do |m|
      m.customize ["modifyvm", :id, "--natdnshostresolver1", "on" ]
      m.customize ["modifyvm", :id, "--memory", 1024]
      m.customize ["modifyvm", :id, "--name", "server"]
      m.customize ["modifyvm", :id, '--cpus', "2"]
    end 
  end
  
  config.vm.provision "shell", inline: <<-SHELL
  sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
  service ssh restart
  SHELL
end
