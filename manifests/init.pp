# Installs fpm gem
class fpm(
    $ruby_versions = undef,
    $version = 'latest',
) {
    if !defined('rvm::system'){
        include rvm::system
    }
    validate_array($ruby_versions)

    $ruby_dev = $::osfamily ? {
        'RedHat' => 'ruby-devel',
        default => 'ruby-dev'
    }

    package {
        'gcc':
            ensure => 'present'
    } ->
    package {
        $ruby_dev:
            ensure => 'present'
    } ->
    fpm::install_gem{ $ruby_versions:
        version => $version
    }
}
