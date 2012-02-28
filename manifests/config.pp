# = Class: hiera::config
#
# Setup required files and folders.
#
# == Actions:
#
# Creates the directory within the puppet folder for hieradata.
# Create the main hiera.yaml file.
#
# == Requires:
#
# Puppet must be installed.
#
class hiera::config {

  require hiera::params

  file {'/etc/puppet/hieradata':
    ensure => 'directory',
  }

  file {'/etc/puppet/hiera.yaml':
    ensure  => 'present',
  }

  if $hiera::params::hierayaml_content == false {
    File['/etc/puppet/hiera.yaml'] {
      source => $hiera::params::hierayaml_source,
    }
  } else {
    File['/etc/puppet/hiera.yaml'] {
      content => $hiera::params::hierayaml_content,
    }
  }


}

