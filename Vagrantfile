# vim: set ft=ruby:

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "web" do |web|
    web.vm.provision "chef_solo" do |chef|
      chef.add_recipe("nginx")
      chef.add_recipe("nginx_lb")
    end
    web.vm.hostname = "web"
		web.vm.network "private_network", ip: "192.168.0.2", :netmask => "255.255.0.0"
  end

  2.times do |n|
    config.vm.define "app#{n}" do |app|
			app.vm.network "private_network", ip: "192.168.1.#{n+2}", :netmask => "255.255.0.0"
      app.vm.hostname = "app#{n}"

      # deploy go binary
      app.vm.provision "chef_solo" do |chef|
        chef.add_recipe "hithere"
      end
    end
  end
end
