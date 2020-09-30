class profile::minecraft {
  # include minecraft
  class {'minecraft':
    install_dir => '/srv/minecraft',
  }
}
