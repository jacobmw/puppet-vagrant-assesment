# Install golang for application build
class profiles::golang {
  package {'golang':
    ensure => "latest",
  }
}
