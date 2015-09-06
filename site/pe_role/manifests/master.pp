class pe_role::master {
  require pe_role::master::prereq

  node_group { 'Linux Servers':
    ensure               => 'present',
    environment          => 'production',
    id                   => '35750923-40b7-44a3-8829-e1d22d093aee',
    override_environment => 'false',
    parent               => 'All Nodes',
    rule                 => ['and', ['not', ['=', ['fact', 'clientcert'], 'ip-10-98-10-38.us-west-2.compute.internal']], ['=', ['fact', 'kernel'], 'Linux']],
  }

  node_group { 'Linux Servers':
    ensure               => 'present',
    environment          => 'production',
    id                   => '35750923-40b7-44a3-8829-e1d22d093aee',
    override_environment => 'false',
    parent               => 'All Nodes',
    rule                 => ['and', ['not', ['=', ['fact', 'clientcert'], 'ip-10-98-10-38.us-west-2.compute.internal']], ['=', ['fact', 'kernel'], 'Linux']],
  }

  node_group { 'Puppet Master':
    ensure               => 'present',
    environment          => 'production',
    override_environment => 'false',
    parent               => 'All Nodes',
    rule                 => ['or', ['=', 'name', "${fqdn}"]],
  }


}
