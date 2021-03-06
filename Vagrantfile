IMAGE_NAME = "ubuntu/focal64"
N = 2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end

    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "k8s-master"
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "kubernetes-setup/master-playbook.yml"
            ansible.extra_vars = {
                node_ip: "192.168.50.10",
            }
        end
        master.vm.provision "file", source: "app/Dockerfile", destination: "/tmp/Dockerfile"
        master.vm.provision "file", source: "app/app.py", destination: "/tmp/app.py"
        master.vm.provision "file", source: "app/gunicorn.sh", destination: "/tmp/gunicorn.sh"
        master.vm.provision "file", source: "app/requirements.txt", destination: "/tmp/requirements.txt"
        master.vm.provision "file", source: "app-k8s/app-secret.yaml", destination: "/tmp/app-secret.yaml"
        master.vm.provision "file", source: "app-k8s/app-deployment.yaml", destination: "/tmp/app-deployment.yaml"
        master.vm.provision "file", source: "mysql/pv.yaml", destination: "/tmp/pv.yaml"
        master.vm.provision "file", source: "mysql/pvc.yaml", destination: "/tmp/pvc.yaml"
        master.vm.provision "file", source: "mysql/secret.yaml", destination: "/tmp/secret.yaml"
        master.vm.provision "file", source: "mysql/service.yaml", destination: "/tmp/service.yaml"
        master.vm.provision "file", source: "mysql/deployment.yaml", destination: "/tmp/deployment.yaml"
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "app-k8s/docker-playbook.yaml"
            ansible.extra_vars = {
                node_ip: "192.168.50.10",
            }
        end
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "app-k8s/app-playbook.yaml"
            ansible.extra_vars = {
                node_ip: "192.168.50.10",
            }
        end
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            node.vm.hostname = "node-#{i}"
            node.vm.provision "ansible" do |ansible|
                ansible.playbook = "kubernetes-setup/node-playbook.yml"
                ansible.extra_vars = {
                    node_ip: "192.168.50.#{i + 10}",
                }
            end
        end
    end
end