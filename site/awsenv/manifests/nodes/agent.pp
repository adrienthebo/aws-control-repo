# this defines a wrapper class, really to capture the params so they can be
# evaled by the templating engine. This assumes it is being run from the master
# this uses a selector to determine if we are using the windows template, if not
# fall through to the linux install script

define awsenv::nodes::agent (
  $pp_department,
  $pp_project,
  $pp_created_by,
  $pp_role,
  $key_name,
  $image_ids,
  $platform_name,
  $security_groups,
  $subnet,
  $nodename           = $title,
  $pe_master_hostname = $::ec2_metadata['local-hostname'],
  $availability_zone  = $::ec2_metadata['placement']['availability-zone'],
  $region             = $::ec2_region,
  $instance_type      = 'm4.large',
) {

  $erbtemplate = $platform_name ? {
    /(windows2012|windows2008)/ => 'awsenv/windows.erb',
    default => 'awsenv/linux.erb',
  }

  ec2_instance { $nodename:
    ensure            => 'running',
    availability_zone => $availability_zone,
    image_id          => $image_ids[$ec2_region][$platform_name],
    instance_type     => $instance_type,
    key_name          => $key_name,
    region            => $region,
    security_groups   => $security_groups,
    subnet            => $subnet,
    tags              => {
      'department'    => $pp_department,
      'project'       => $pp_project,
      'created_by'    => $pp_created_by,
    },
    user_data         => template($erbtemplate),
  }

}
