# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'fileutils'

Vagrant.require_version ">= 1.6.0"

# Defaults for config options defined in CONFIG
$vb_gui = false
$update_channel = "alpha"
$vb_memory = 1024
$vb_cpus = 1

Vagrant.configure("2") do |config|
  # always use Vagrants insecure key
  config.ssh.insert_key = false
  
  config.vm.box = "coreos-%s" % $update_channel
  config.vm.box_version = ">= 308.0.1"
  config.vm.box_url = "http://%s.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json" % $update_channel
  config.vm.provider :virtualbox do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in CoreOS, so tell Vagrant that so it can be smarter.
    v.check_guest_additions = false
    v.functional_vboxsf     = false
  end

  # plugin conflict
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.define vm_name = "coreos-registry" do |config|
    config.vm.hostname = vm_name
    config.user.coreos_box.forwarded_ports.each do |port|
      symport = Hash[port.map{|k,v| [k.to_sym,v]}]
      config.vm.network :forwarded_port, symport
    end
    config.vm.provider :virtualbox do |vb|
        vb.gui = $vb_gui
        vb.memory = $vb_memory
        vb.cpus = $vb_cpus
    end

    ip = "172.12.8.100"
    config.vm.network :private_network, ip: ip


   end
end
