class pe_role::master::prereq {

  package { 'aws-sdk-core':
    ensure   => present,
    provider => puppet_gem,
  }

  package { 'retries':
    ensure   => present,
    provider => puppet_gem,
  }

  package { 'puppetclassify':
    ensure   => present,
    provider => puppet_gem,
  }


}
