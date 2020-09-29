class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQCnNCraI4OaE9Jceos1bJyEKXyfJTBsuQBhWy/eSNIS8JJwjP++UHNiKQp03CgF3NZ9dOnCF1H4TqZWI9607glsukcnb1dWv3MeBYRvtRBn4iILRgJlNNlxL940tcZRRkayETu718+lhVTN3in/9rfVtOfgmee4UL7j9Uopk8u3wqC/9mo9wXPubSR/qsTEIFTxw1fSEVgkPRT/TPBVIZ8ygW90FuOKfcYu7SqQrdIvGRodIArcAgAkvsBs/PyEbyULpKKdGl4HbjCP8leIUrWZvHPg7kbSgneCM/v+Q6WUL3mXCAOwdU2eBAsruYKSYzkvA6Y7ubaXIaAkLXWqrvovouusDYcAXqkXgSbMxrY/WfTt2GlBz76Mw/XDOmueooFJ+xbhbT1k2QgOVdOCDFYQXtnK8nl+3L06eX2V8OkN7nxvmEhuc7EXF0cCvEAsMcaVDCDRNpGcuBBIxWkwPGbws30dS3Bj6PydHdXgOuHovLpqiml/LzpCttdC53fCF3U=',
  }
}
