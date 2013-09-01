Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu-13.04-server-amd64-cloud'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.provision :puppet do |p|
    p.manifests_path = 'puppet/manifests'
    p.module_path = 'puppet/modules'
    p.manifest_file = 'site.pp'
    p.options = '--verbose'
  end

  config.vm.provider :virtualbox do |vbox|
    vbox.gui = true
  end

  config.vm.define :cloud0 do |c0|
    c0.vm.hostname = 'cloud0.contiki.puppetlabs.vm'
  end
end  
