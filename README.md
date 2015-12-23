# Puppet module for fpm gem installation

* Requires ruby to be installed via the maestrodev/rvm module

# Example

```
class { 'fpm':
  ruby_versions => ['2.0.0', '1.9.3']
}
```
