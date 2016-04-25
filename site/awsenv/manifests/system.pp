define awsenv::system(
  $pp_role,
  $platform_name
) {

  $image_ids            = lookup('awsenv::image_ids')
  $department           = $::ec2_tags['department']
  $project              = $::ec2_tags['project']
  $created_by           = $::ec2_tags['created_by']
  $region               = $::ec2_region
  $agents_sg_name       = "${department}-${region}-agents"
  $crossconnect_sq_name = "${department}-${region}-crossconnect"
  $agent_subnet         = "${department}-${region}-avza"

  $public_key = split($::ec2_metadata['public-keys']['0']['openssh-key'], ' ')
  $key_name = $public_key[2]

  awsenv::nodes::agent { $title:
    pp_department   => $department,
    pp_project      => $project,
    pp_created_by   => $created_by,
    key_name        => $key_name,
    image_ids       => $image_ids,
    security_groups => [
      $agents_sg_name,
      $crossconnect_sq_name],
    subnet          => $agent_subnet,
  }
}
