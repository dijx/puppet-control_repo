 class minecraft (

  $url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  $install_dir = '/opt/minecraft'
  ){

  file {$install_dir:
    ensure => directory,
  }

  file {"${install_dir}/minecraft_server.1.12.2.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }

  file {"${install_dir}/minecraft_server.jar":
    ensure => link,
    target => "${install_dir}/minecraft_server.1.12.2.jar",
  }

  # file {'/opt/minecraft/minecraft_server.jar'
  #   source => '/opt/minecraft/minecraft_server.1.12.2.jar'
  # }

  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true'
  }
  # file {'/etc/systemd/system/minecraft.service':
  #   ensure => file,
  #   source => 'puppet:///modules/minecraft/minecraft.service',
  # }

  file {'/etc/systemd/system/minecraft.service':
    ensure  => file,
    content => epp('minecraft/minecraft.service.epp', {
      install_dir => $install_dir,
    }),
  }

  service { 'minecraft':
    ensure  => running,
    enable  => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}
