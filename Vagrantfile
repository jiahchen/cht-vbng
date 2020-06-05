VAGRANTFILE_API_VERSION = "2"
require 'yaml'
VM_CONF = YAML.load_file('config.yaml')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.shell="bash"

  config.vm.define VM_CONF["name"] do |vm_config|
    vm_config.vm.box = "ubuntu/trusty64"
    vm_config.vm.hostname = VM_CONF["name"]
    vm_config.vm.network "public_network", bridge: VM_CONF["bng_net_if"], auto_config: false
    vm_config.vm.provision "file", source: "setup.sh", destination: "/tmp/setup.sh"
    vm_config.vm.provision "shell",
      run: "always",
      privileged: true,
      inline: "/tmp/setup.sh"
    
    vm_config.vm.provision "file", source: "pppoe/pppoe-server-options", destination: "/tmp/pppoe-server-options"
    vm_config.vm.provision "file", source: "pppoe/chap-secrets", destination: "/tmp/chap-secrets"
    vm_config.vm.provision "shell",
      run: "always",
      privileged: true,
      inline: "mv /tmp/pppoe-server-options /etc/ppp/pppoe-server-options && \
               mv /tmp/chap-secrets /etc/ppp/chap-secrets && \
               pppoe-server -I eth1.895 -L 10.10.10.1 -R 10.10.10.100 -N 100"
  end
end
