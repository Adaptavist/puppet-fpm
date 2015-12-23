# Installs fpm gem
class fpm(
    $ruby_versions = undef
) {
    if !defined('rvm::system'){
        include rvm::system
    }
    validate_array($ruby_versions)

    package {
        'gcc':
            ensure => 'installed'
    } ->
    package {
        'ruby-dev':
            ensure => 'installed',
            alias  => 'ruby-devel'
    } ->
    fpm::install_gem{ $ruby_versions: }
}
