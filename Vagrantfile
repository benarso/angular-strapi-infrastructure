# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV['FORWARD_DOCKER_PORTS'] = "1"
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"
  #config.vm.box = "hashicorp/boot2docker"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 80, host: 80, auto_correct: true
  config.vm.network "forwarded_port", guest: 1337, host: 1337, auto_correct: true
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network "private_network", type: "dhcp"
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder "apps", "/apps"
  #config.vm.synced_folder "data", "/home/vagrant/data"
  #config.vm.synced_folder "data", "/tmp/data", owner: "vagrant"
  #config.vm.synced_folder "config/nginx", "/vagrant/laradock/nginx"



  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  config.ssh.forward_agent = true
  #config.ssh.private_key_path = "#{Dir.home}/.ssh/id_rsa"
  config.vm.provision "shell" do |s|
  ssh_prv_key = ""
  ssh_pub_key = ""
  if File.file?("#{Dir.home}/.ssh/id_rsa")
    ssh_prv_key = File.read("#{Dir.home}/.ssh/id_rsa")
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
  else
    puts "No SSH key found. You will need to remedy this before pushing to the repository."
  end
  s.inline = <<-SHELL
    if grep -sq "#{ssh_pub_key}" /home/vagrant/.ssh/authorized_keys; then
      echo "SSH keys already provisioned."
      exit 0;
    fi
    echo "SSH key provisioning."
    mkdir -p /home/vagrant/.ssh/
    touch /home/vagrant/.ssh/authorized_keys
    echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    echo #{ssh_pub_key} > /home/vagrant/.ssh/id_rsa.pub
    chmod 644 /home/vagrant/.ssh/id_rsa.pub
    echo "#{ssh_prv_key}" > /home/vagrant/.ssh/id_rsa
    chmod 600 /home/vagrant/.ssh/id_rsa
    chown -R vagrant:vagrant /home/vagrant
    exit 0
  SHELL
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision :shell, path: "provision.sh"
   config.vm.provision :shell, path: "up.sh", run: 'always'
end
