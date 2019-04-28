# Run the "webapp"
class profiles::go_webapp::run {
  include systemd::systemctl::daemon_reload
  file { '/usr/lib/systemd/system/gowebapp.service':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    content => "[Unit]
Description=go-webapp service
After=network.target

[Service]
User=root
WorkingDirectory=/usr/bin/
ExecStart=/usr/bin/go-webapp
Restart=always

[Install]
WantedBy=multi-user.target",
  } ~> 
  Class['systemd::systemctl::daemon_reload']
  service {'gowebapp':
    ensure    => 'running',
    subscribe => File['/usr/lib/systemd/system/gowebapp.service'],
  }

  exec {'enable-service-go_webapp':
    command => 'systemctl enable gowebapp',
    path    => ['/usr/bin', '/usr/sbin'],
    unless  => 'stat /etc/systemd/system/multi-user.target.wants/gowebapp.service',
  }
}
