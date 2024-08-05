# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master" => {"memory" => "1012", "cpu" => "1", "ip" => "320", "image" => "beirao/ubuntu-22.04"},
  "node01" => {"memory" => "1012", "cpu" => "1", "ip" => "321", "image" => "beirao/ubuntu-22.04"},
  "node02" => {"memory" => "1012", "cpu" => "1", "ip" => "322", "image" => "beirao/ubuntu-22.04"},
  "node03" => {"memory" => "1012", "cpu" => "1", "ip" => "323", "image" => "beirao/ubuntu-22.04"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "19.16.24.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        
      end
      machine.vm.provision "shell", path: "docker.sh"
      
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end

    end
  end
end
