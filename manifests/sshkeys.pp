case $::kernel {
  'Linux': {
    ssh_authorized_key { 'cbarker':
      ensure  => present,
      user    => 'ec2-user',
      name    => 'cbarker@puppetlabs.com',
      key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCufvNyNaJo/wI2x3Goo86Qke9Lr9pINzhPLNXNqElcMTR4wrEM9134QNztfDFf+RYKTAKOWn/75d5zFxXQRm464Pay1Omx5Fh5syUWVSXGsMfWl9jWJYTxPlRon7opIGhCFFEO+87+7qMCA3wmERWvhEhionQA16qbMrGJ1Xbq4oMX2vhMJjfgihj6rQefHIPwhR7rrfzNQclqWiq4hpTeEFvaq+xB8zMyzRLRQsyvWcSkjOOiMeN9IwDLFVGM+pKZS/gFPvDGJNFdVHbNfu0AD2lvrE6WWjpa9retNnWy/XlEcYkYq3NnWSNMKlDbo/3GtX0oLJSeHEWWy9mmWwUx',
      type    => 'ssh-rsa',
    }
    ssh_authorized_key { 'lee':
      ensure  => present,
      user    => 'ec2-user',
      name    => 'lee.rich@puppetlabs.com',
      key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDFMbczwzDoCLYgkKneVTnl5rldkmGoT4+KQ9mNsQaqDXpsulgILowYU7mL2OsUN7fNQ5X3AOieGh9F6LHS1zopEkargkwnxJcBZd1ouiM6lmQIvjWpWxqGUe+r6h+4z8cs3TuBItLDNimk9kFtpgTtyY8fA9OVtjiBJOf9apfe6mqT3NIxwlUO3etde50utEOdoichTSf9E5AifDhB0yEGV7dMOnJMmJSAb/yF6+6RbuM2S5crIys9YHzPqrV0CVLOo3R3h8WczVO8T4MYrNZoMeBDvEA+ZgFgH0NR8cW0pi/iv0AdzT+o95PVnyBxENeQUX/SMqqVLlAyP3SDGnHT',
      type    => 'ssh-rsa',
    }
  }
  'windows': {
    notify {'this is windows': }
  }
}
