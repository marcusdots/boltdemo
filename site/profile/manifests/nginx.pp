class profile::nginx(
  String $webisonline = pick( $facts['webisonline'], "webisonline"),
){
  include 'nginx'

  notify { $facts['webisonline']: }

  file { '/var/www':
    ensure => 'directory',
  }
  file { '/var/www/voxpupuli.org/':
    ensure => 'directory',
  }
  file { '/var/www/voxpupuli.org/webisonline':
    ensure  => 'file',
    content => $webisonline,
  }

  nginx::resource::server { 'voxpupuli.org':
    www_root => '/var/www/voxpupuli.org',
  }
}
