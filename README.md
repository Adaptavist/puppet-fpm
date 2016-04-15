# Puppet module for fpm gem installation
[![Build Status](https://travis-ci.org/Adaptavist/puppet-fpm.svg?branch=master)](https://travis-ci.org/Adaptavist/puppet-fpm)

* Requires ruby to be installed via the maestrodev/rvm module

# Example

```
class { 'fpm':
  ruby_versions => ['2.0.0', '1.9.3'],
  version => '1.4.0'
}
```
