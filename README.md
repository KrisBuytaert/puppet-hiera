# Hiera

## Usage

This module adds support for hiera-puppet.
Within the lib folder, we have mirrored the hiera-puppet repository
so the functionallity becomes available in puppet for versions before 3.0.0.

### Requirements

This module will atempt to install 2 packages:

* `rubygem-hiera`
* `rubygem-hiera-puppet`

If you do not have these packages, you can either use
[this script](https://github.com/Inuits/build-gems/) or use the packages that
have been built using the script.

You can also override the packages using the `hiera::params` class. We prefer
that you add full support for your distro ofcourse but this can be an easy way
to test and start using the module.

### Example

Overriding the packages to install:

      class {'hiera::params':
        packages => ['gem-hiera', 'gem-hiera-puppet' ],
      }
      include hiera

## Development

### Todo

If you have some spare time or need these improvements, feel free to send pull
requests.

* Add support for other distros. Currently only CentOS is supported.
* Figure out how to deal with puppet 3.0.0.
* Keep track of upstream releases. Upgrade too.
* Todo: Add an example on how one could use this module. reference hiera documentation.

### Changes

#### 1.0.0

* Upgraded to upstream hiera-puppet 1.0.0
* Removed `hiera::type`. Leftovers from the old hack making easy upstream upgrades a hastle. <br/>
   The functionallity this class provided is resolved by installing the rubygem for hiera-puppet.

#### 0.3.0

* Removed the use of a submodule and a symlink in favor of merging upstream in the lib folder.


