# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm;box_url = 'debian/buster64'
  config.vm.box_check_update = false

  #Server vm 
  config.vm.define 'server' do |server|
    server.vm.hostname = 'server'
    server.vm.network 'private_network', ip: '192.168.50.10'
    server.vm.provider 'virtualbox' do |s|
      s.customize ["modifyvm", :id, "--natdnshostresolver1", "on" ]
      s.customize ["modifyvm", :id, "--memory", 1024]
      s.customize ["modifyvm", :id, "--name", "server"]
      s.customize ["modifyvm", :id, '--cpus', "2"]
    end
    server.vm.provision "shell", path: "provision/provision.server.sh"
  end

  # Clients vm 
  numberClient=2
  (1..numberClient) .each do |i|
    config.vm.define "client#{i}" do |client|
      client.vm.hostname = "client#{i}"
      client.vm.network 'private_network', ip: "192.168.50.1#{i}"
      client.vm.provider 'virtualbox' do |c|
        c.memory = 512
        c.name = "client#{i}"
        c.cpus = 1
      end 
    end
  end
  
  #Give the access to ssh connect
  config.vm.provision "shell", inline: <<-SHELL
  sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
  service ssh restart
  SHELL
end
