# Class: hiera
#
# This module manages hiera
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]

class hiera::packages {
  package {
    "rubygem-hiera":
      ensure => present;
  }
  package {
    "rubygem-hiera-puppet":
      ensure => present;
  }
}

class hiera::type {
  # Hiera isn't packaged with Puppet yet so even when installing both rubygems The files need to be copied to the appropirate
  # location.  Obviously this is an extremly ugly hack
  file { '/usr/lib/ruby/site_ruby/1.8/puppet/parser/functions/hiera_array.rb':
    ensure  => 'file',
    group   => '0',
    mode    => '644',
    owner   => '0',
    require => Package['rubygem-hiera-puppet'],
    source  => '/usr/lib/ruby/gems/1.8/gems/hiera-puppet-0.3.0/lib/puppet/parser/functions/hiera_array.rb',
  }

  file { '/usr/lib/ruby/site_ruby/1.8/puppet/parser/functions/hiera_hash.rb':
    ensure => 'file',
    group  => '0',
    mode   => '644',
    owner  => '0',
    require => Package['rubygem-hiera-puppet'],
    source => '/usr/lib/ruby/gems/1.8/gems/hiera-puppet-0.3.0/lib/puppet/parser/functions/hiera_hash.rb',
  }

  file { '/usr/lib/ruby/site_ruby/1.8/puppet/parser/functions/hiera_include.rb':
    ensure => 'file',
    group  => '0',
    mode   => '644',
    owner  => '0',
    require => Package['rubygem-hiera-puppet'],
    source => '/usr/lib/ruby/gems/1.8/gems/hiera-puppet-0.3.0/lib/puppet/parser/functions/hiera_include.rb',
  }

  file { '/usr/lib/ruby/site_ruby/1.8/puppet/parser/functions/hiera.rb':
    ensure => 'file',
    group  => '0',
    mode   => '644',
    owner  => '0',
    require => Package['rubygem-hiera-puppet'],
    source => '/usr/lib/ruby/gems/1.8/gems/hiera-puppet-0.3.0/lib/puppet/parser/functions/hiera.rb',
  }

}

class hiera::config{
  # Only specifying file locations and existance, not the content ..
  #

  file {'/etc/puppet/hieradata':
    ensure => directory,
  }
  file {'/etc/puppet/hiera.yaml':
    ensure => present,
  }


}



class hiera {
  include hiera::packages
  include hiera::type
  include hiera::config

}
