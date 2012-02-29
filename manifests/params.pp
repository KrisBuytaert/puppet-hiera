# = Class: hiera::params
#
# Configure settings for hiera
#
# == Parameters:
#
# $package::    Override packages to be installed.
#
# == Sample Usage:
#
#   class {'hiera::params':
#     param => 'value'
#   }
#
# == Todo:
#
# * Add parameters to docs.
#
class hiera::params (
  $package = undef,
  $hiera_yaml_content = undef,
  $hiera_yaml_template = undef,
  $hiera_yaml_source = undef
){
  ## Copy paste snippets:
  # template("${module_name}/template.erb")
  # source => "puppet:///modules/${module_name}/file"

  $packages = $package ? {
    undef   => $::operatingsystem ? {
      default => ['rubygem-hiera', 'rubygem-hiera-puppet']
    },
    default => $package,
  }

  if $hiera_yaml_content != undef {
    $hierayaml_content = $hiera_yaml_content
  }
  elsif $hiera_yaml_template != undef {
    $hierayaml_content = template($hiera_yaml_template)
  }
  elsif $hiera_yaml_source != undef {
    $hierayaml_source = $hiera_yaml_source
    $hierayaml_content = false
  }
  else {
    $hierayaml_content = ''
  }


}

