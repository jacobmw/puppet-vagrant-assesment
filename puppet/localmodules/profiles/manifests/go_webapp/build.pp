# Build the "webapp"
class profiles::go_webapp::build {
  exec {'build-go_webapp':
    command => 'go build  -o /vagrant/app/go-webapp /vagrant/app/go-webapp.go',
    path    => ['/usr/bin', '/usr/sbin'],
  }
}
