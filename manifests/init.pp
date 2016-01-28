# Installs fpm gem
class fpm(
    $ruby_versions = undef,
    $ensure = 'latest',
) {
    if !defined('rvm::system'){
        include rvm::system
    }
    validate_array($ruby_versions)

    $ruby_dev = $::osfamily ? {
        RedHat => 'ruby-devel',
        default => 'ruby-dev'
    }

    package {
        'gcc':
            ensure => $ensure
    } ->
    package {
        $ruby_dev:
            ensure => $ensure
    } ->
    fpm::install_gem{ $ruby_versions:
        ensure => $ensure
    }
}
