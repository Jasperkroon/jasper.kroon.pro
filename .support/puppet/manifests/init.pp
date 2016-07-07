# Set default path for Exec calls
Exec {
  path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}

class params {
  $dbname = 'rhea'
  $dbuser = 'rhea'
  $dbpass = 'rhea'
}

  notify {"Message from here: $dbname":}


node default {
  include rhea
}


