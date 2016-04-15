define fpm::install_gem($ruby_ver = $title, $version = 'latest'){
    rvm_gem {
        "ruby-${ruby_ver}/fpm":
            ensure       => $version,
            name         => 'fpm',
            ruby_version => "ruby-${ruby_ver}",
            require      => Rvm_system_ruby[$ruby_ver]
    }
}
