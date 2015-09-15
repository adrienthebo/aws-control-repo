class pe_role::master {
  include ntp

  node_group { 'Linux Servers':
    ensure               => 'present',
    environment          => 'production',
    override_environment => 'false',
    parent               => 'All Nodes',
    rule                 => ['and', ['not', ['=', ['fact', 'clientcert'], "${fqdn}"]], ['=', ['fact', 'kernel'], 'Linux']],
  }

  node_group { 'Tomcat':
    ensure               => 'present',
    classes              => {'ntp' => {}, 'tomcatdemo' => {}, 'tse_admins' => {}},
    environment          => 'production',
    override_environment => 'false',
    parent               => 'Linux Servers',
    rule                 => ['and', ['=', ['fact', 'role'], 'tomcat']],
    require              => Node_group['Linux Servers']
  }

  node_group { 'Puppet Master':
    ensure               => 'present',
    classes              => {'ntp' => {}, 'tse_admins' => {}},
    environment          => 'production',
    override_environment => 'false',
    parent               => 'All Nodes',
    rule                 => ['or', ['=', 'name', "${fqdn}"]],
  }


}
