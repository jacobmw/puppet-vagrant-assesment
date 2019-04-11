# Build the "webapp"
class profiles::go_webapp::build {
  exec {'build-go_webapp':
    command => '/bin/go build /vagrant/app/go-webapp.go',
    cwd  => '/vagrant/app',
  }
}
