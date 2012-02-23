# = Class: hiera::packages
#
# Installs packages for hiera
#
# == Actions:
#
# Describe what packages get installed and when.
#
# == Requires:
#
# Requirements. This could be (external) packages that should be made available.
#
# == Sample Usage:
#
#   include hiera::packages
#
class hiera::packages {

  require hiera::params

  package {$hiera::params::packages:
    ensure => 'installed',
  }

}

