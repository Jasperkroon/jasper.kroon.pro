class rhea::sql {
  file { '/root/puppet-mysql':
    ensure => directory
  }

  class { "mysql":
    require => File["/root/puppet-mysql"],
  }

  exec { 'change-bind-address':
    command => '/usr/bin/env sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf',
    onlyif  => 'grep -c "^bind-address" /etc/mysql/my.cnf"',
    require => Package["mysql"],
    notify  => Service["mysql"],
  }

  mysql::query { 'create-db':
    mysql_db    => "",
    mysql_query => "create database if not exists rhea"
  }

  mysql::query { 'create-user-external':
    mysql_db    => "",
    mysql_query => "grant all on rhea.* to 'rhea'@'%' identified by 'rhea'",
    require     => Mysql::Query["create-db"],
  }

  mysql::query { 'create-user-local':
    mysql_db    => "",
    mysql_query => "grant all on $rhea.* to 'rhea'@'localhost' identified by 'rhea'",
    require     => Mysql::Query["create-db"],
  }
}
