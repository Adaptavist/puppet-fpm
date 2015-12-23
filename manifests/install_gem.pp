define fpm::install_gem($ruby_ver = $title){
    rvm_gem {
        "ruby-${ruby_ver}/fpm":
            ensure       => 'latest',
            name         => 'fpm',
            ruby_version => "ruby-${ruby_ver}",
            require      => Rvm_system_ruby[$ruby_ver]
    }
}
