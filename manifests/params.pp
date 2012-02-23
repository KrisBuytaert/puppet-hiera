# = Class: hiera::params
#
# Configure settings for hiera
#
# == Parameters:
#
# $param::   description of parameter. default value if any.
#
# == Sample Usage:
#
#   class {'hiera::params':
#     param => 'value'
#   }
#
class hiera::params (
  $package = undef
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

}

