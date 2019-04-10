NODES = (JSON.parse(File.read("nodes.json")))['nodes']

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ben-cts/centos-7'
  config.vm.box_version = '0.0.4'

  NODES.each do |node|
    node_name = node[0]
    node_config = node[1]

    config.vm.define node_name do |config|
      ports = node_config['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          host:   port['host'],
          guest:  port['guest'],
          id:     port['id']
      end

      config.vm.hostname = node_name
      config.ssh.insert_key = false
      config.vm.network :private_network, ip: node_config['ip']
      config.vm.synced_folder "puppet/hieradata", "/tmp/vagrant-puppet/hieradata"
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", node_config['memory']]
        vb.customize ["modifyvm", :id, "--name", node_name]
      end

      config.vm.provision "shell",
        inline: "sed -i '3 i nameserver 8.8.8.8' /etc/resolv.conf && cd /vagrant/puppet/ && /opt/puppetlabs/puppet/bin/librarian-puppet install"

      config.vm.provision "puppet" do |puppet|
        puppet.options = "--test"
        puppet.working_directory = "/tmp/vagrant-puppet/"
        puppet.hiera_config_path = "puppet/hiera.yaml"
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = "site.pp"
        puppet.module_path = ["puppet/modules", "puppet/localmodules"]
        puppet.facter = {
          "role" => node_config['role']
        }
      end
    end
  end
end
