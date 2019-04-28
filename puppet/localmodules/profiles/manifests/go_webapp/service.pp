# Run the "webapp"
class profiles::go_webapp::run {
  exec {'run-go_webapp':
    command => '/vagrant/app/go-webapp &',
    path    => ['/usr/bin', '/usr/sbin'],
  }
}
