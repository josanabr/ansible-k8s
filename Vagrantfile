#IMAGE_NAME = "bento/ubuntu-16.04"
IMAGE_NAME = "ubuntu/xenial64"
N = 2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
      
    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.200.100"
        master.vm.hostname = "k8s-master"
	master.vm.provider "virtualbox" do |v|
		v.memory = 3072
		v.cpus = 2
	end
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "kubernetes-setup/master-playbook.yml"
            ansible.extra_vars = {
                node_ip: "192.168.200.100",
            }
        end
	master.vm.provision "shell", path: "scripts/dockercompose.sh"
    end

    (1..N).each do |i|
        config.vm.define "k8s-worker#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.200.#{i + 100}"
            node.vm.hostname = "node-#{i}"
            node.vm.provision "ansible" do |ansible|
                ansible.playbook = "kubernetes-setup/node-playbook.yml"
                ansible.extra_vars = {
                    node_ip: "192.168.200.#{i + 100}",
                }
            end
        end
    end
end
