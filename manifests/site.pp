node default {
  file { '/root/README':
    ensure  => file,
    content => 'this is a readme',
    owner   => 'root',
    group   => 'users',
  }

  file { '/home/vagrant/README':
    ensure  => file,
    content => 'this is a readme',
    owner   => 'vagrant',
    group   => 'vagrant',
  }
}
