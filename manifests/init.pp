# Installs fpm gem
class fpm(
    $ruby_versions = undef
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
            ensure => 'installed'
    } ->
    package {
        $ruby_dev:
            ensure => 'installed'
    } ->
    fpm::install_gem{ $ruby_versions: }
}
