# = Class: hiera
#
# This module manages hiera
#
class hiera {
  include hiera::packages
  include hiera::config
}
