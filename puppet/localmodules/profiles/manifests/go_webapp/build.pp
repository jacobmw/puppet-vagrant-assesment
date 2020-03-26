# Build the "webapp"
class profiles::go_webapp::build {
  exec {'build-go_webapp':
    path => ['/usr/bin', '/usr/sbin', '/bin'],
    user => 'root',
    cwd => '/vagrant/app/',
    environment => ["GOCACHE=/root/.cache/go-build"],
    command => 'go build /vagrant/app/go-webapp.go',
  }
}
