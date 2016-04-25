class {'awsenv':
  availability_zone  => 'us-west-2a',
  region             => 'us-west-2',
  aws_keyname        => 'adrien+aws@sky',
  created_by         => 'adrienthebo',
  project            => 'cloudpassage-integration',
  department         => 'eng-sec',
  master_iam_profile => 'puppetlabs_aws_provisioner',
}
