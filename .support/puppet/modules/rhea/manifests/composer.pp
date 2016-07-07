class rhea::composer {
  exec { 'install-composer' :
    command => '/usr/bin/env curl -s https://getcomposer.org/installer | /usr/bin/env php -- --install-dir=/home/vagrant/bin',
    creates => '/home/vagrant/bin/composer.phar',
    require => [ File["/home/vagrant/bin"], Class["php"], Package["curl"] ],
  }

  exec { 'link-composer' :
    command => '/usr/bin/env ln -s /home/vagrant/bin/composer.phar /home/vagrant/bin/composer',
    creates => '/home/vagrant/bin/composer',
    require => Exec["install-composer"],
  }

  exec { 'run-composer-install':
    command => '/usr/bin/env php /home/vagrant/bin/composer.phar install',
    cwd => '/vagrant',
    require => Exec["link-composer"],
  }
}
