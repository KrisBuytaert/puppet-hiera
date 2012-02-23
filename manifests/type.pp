# = Class: hiera::type
#
# Hiera isn't packaged with Puppet yet so even when installing both rubygems,
# the files need to be copied to the appropriate location.  Obviously this is
# an extremly ugly hack
#
# == Actions:
#
# Put required files in place.
#
# == Requires:
#
# Hiera packages and puppet installed.
#
# == Todo:
#
# * Make this a less ugly hack.
# * Remove static file locations and put them in the params class.
#
#
class hiera::type {

  file { '/usr/lib/ruby/site_ruby/1.8/puppet/parser/functions/hiera_array.rb':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['rubygem-hiera-puppet'],
    source  => '/usr/lib/ruby/gems/1.8/gems/hiera-puppet-0.3.0/lib/puppet/parser/functions/hiera_array.rb',
  }

  file { '/usr/lib/ruby/site_ruby/1.8/puppet/parser/functions/hiera_hash.rb':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['rubygem-hiera-puppet'],
    source  => '/usr/lib/ruby/gems/1.8/gems/hiera-puppet-0.3.0/lib/puppet/parser/functions/hiera_hash.rb',
  }

  file { '/usr/lib/ruby/site_ruby/1.8/puppet/parser/functions/hiera_include.rb':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['rubygem-hiera-puppet'],
    source  => '/usr/lib/ruby/gems/1.8/gems/hiera-puppet-0.3.0/lib/puppet/parser/functions/hiera_include.rb',
  }

  file { '/usr/lib/ruby/site_ruby/1.8/puppet/parser/functions/hiera.rb':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['rubygem-hiera-puppet'],
    source  => '/usr/lib/ruby/gems/1.8/gems/hiera-puppet-0.3.0/lib/puppet/parser/functions/hiera.rb',
  }

}

