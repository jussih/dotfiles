Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    # This error occurs because Ubuntu tries to raise all your network interfaces, but your cable isn't connected, then it waits until his timeout.
    # Link: https://github.com/mitchellh/vagrant/issues/8056
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.inventory_path = "hosts"
    ansible.limit = "localhost"
  end
end
