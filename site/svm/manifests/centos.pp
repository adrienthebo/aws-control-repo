class svm::centos {
  package { 'polkit':
    ensure => '0.112-5.el7',
  }
}
