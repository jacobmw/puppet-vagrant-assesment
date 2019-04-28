# Build the "webapp"
class profiles::go_webapp::build {
  exec {'build-go_webapp':
    command => 'go build  -o /usr/bin/go-webapp /vagrant/app/go-webapp.go',
    path    => ['/usr/bin', '/usr/sbin'],
    unless  => 'stat /usr/bin/go-webapp',
  }
}
