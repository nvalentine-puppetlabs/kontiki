node /^cloud0.*$/ {
  class { 'openstack::test_file': }

  $public_interface        = 'eth0'
  $private_interface       = 'eth1'
  $admin_email             = 'root@localhost'
  $admin_password          = 'keystone_admin'
  $cinder_user_password    = 'cinder_pass'
  $cinder_db_password      = 'cinder_pass'
  $keystone_db_password    = 'keystone_db_pass'
  $keystone_admin_token    = 'keystone_admin_token'
  $nova_db_password        = 'nova_pass'
  $nova_user_password      = 'nova_pass'
  $glance_db_password      = 'glance_pass'
  $glance_user_password    = 'glance_pass'
  $rabbit_password         = 'openstack_rabbit_password'
  $rabbit_user             = 'openstack_rabbit_user'
  $fixed_network_range     = '10.0.0.0/24'
  $floating_network_range  = '192.168.101.64/28'
  $secret_key              = 'secret_key'
  $verbose                 = true
  $auto_assign_floating_ip = false

  include 'apache'

  class { 'openstack::all':
    public_address          => $ipaddress_eth0,
    public_interface        => $public_interface,
    private_interface       => $private_interface,
    admin_email             => $admin_email,
    admin_password          => $admin_password,
    cinder_db_password      => $cinder_db_password,
    cinder_user_password    => $cinder_user_password,
    keystone_db_password    => $keystone_db_password,
    keystone_admin_token    => $keystone_admin_token,
    nova_db_password        => $nova_db_password,
    nova_user_password      => $nova_user_password,
    glance_db_password      => $glance_db_password,
    glance_user_password    => $glance_user_password,
    rabbit_password         => $rabbit_password,
    rabbit_user             => $rabbit_user,
    libvirt_type            => 'kvm',
    floating_range          => $floating_network_range,
    fixed_range             => $fixed_network_range,
    verbose                 => $verbose,
    auto_assign_floating_ip => $auto_assign_floating_ip,
    secret_key              => $secret_key,
    quantum                 => false,
  }

  class { 'openstack::auth_file':
    admin_password       => $admin_password,
    keystone_admin_token => $keystone_admin_token,
    controller_node      => '127.0.0.1',
  }
}

node default { 
  notify { "${::hostname} fell through to default node classification.": }
}
