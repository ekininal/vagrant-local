# vagrant-local

## Installation
```
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
```
## Usage

###### Vagrant-local geliştirme ortamını yerelimize almak git clone komutunu çalıştıralım:
```
git clone git@github.com:ekininal/vagrant-local.git
```

###### Değişiklikleri çalıştırmak için vagrant up komutunu çalıştıralım. Bu komut ile öncelikle 3 tane VM oluşacak. Bu VMler "ubuntu/focal64" imajı ile oluşan VMlerdir.Bu VMlerden bir tane Kubernetes master node, diğer iki node ise kubernetes worker nodelarıdır. Bu k8s nodeları vagrantfile içerisinde çalışan ansible Vagrantfile içindeki ile oluşturulmuştur. Uygulamanın ve Mysql'in kubernetes ortamına deploymentı için gerekli K8s yamlları da bu vagrantfile ile /tmp altına kopyalanır. ansible playbook'u yardımıyla deploy edilir.
```
vagrant up
```

###### Geliştirme ortamında değişiklik yapıldıysa vagrant destroy vagrant up komutu ile yeniden kurulum sağlanarak uygulama tarafındaki değişiklikler alınır.
```
vagrant destroy
vagrant up
```