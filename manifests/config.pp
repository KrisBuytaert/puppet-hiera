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

  file {'/etc/puppet/hieradata':
    ensure => 'directory',
  }
  file {'/etc/puppet/hiera.yaml':
    ensure => 'present',
  }


}

