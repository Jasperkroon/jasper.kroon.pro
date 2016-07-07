class rhea {
  include rhea::sql
  include rhea::composer

  Package { ensure => "present" }

  package { "git": }
  package { "vim": }
  package { "curl": }
  package { "make": }
  package { "subversion": }
  package { "augeas-tools": }
  package { "libaugeas-dev": }
  package { "libaugeas-ruby": }
  package { "subversion-tools": }
  package { "python-setuptools": }
  package { "texlive-latex-extra": }
  package { "texlive-fonts-recommended": }
  package { "texlive-latex-recommended": }

  class { php: }
  class { apache: }
  php::module { 'curl': }
  php::module { 'mysql': }

  package { 'libssh2-php':
      require => Class["php"]
  }

  file { "/home/vagrant/bin" :
    ensure => 'directory'
  }

  # Create the input directory and the log/cache directories
  file { [ "/var/tmp/rhea",
            "/var/tmp/rhea/dropbox",
            "/var/tmp/rhea/poms_dropbox",
            "/var/log/rhea",
            "/var/cache/rhea",
            "/var/tmp/rhea/pid"
    ]:
    ensure => "directory",
    owner  => "vagrant",
    group  => "vagrant",
    mode   => 0777,
  }

  exec { "update-sphinx":
    command => "easy_install -U Sphinx",
    require => Package["python-setuptools"],
  }
}
