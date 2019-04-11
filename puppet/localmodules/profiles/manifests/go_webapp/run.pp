# Run the "webapp"
class profiles::go_webapp::run {
  service { "gowebapp":
  	ensure  => running,
  	enable => true,
  	start => '/vagrant/app/gowebapp.sh start',
  	stop => '/vagrant/app/gowebapp.sh stop',
  	status => '/vagrant/app/gowebapp.sh status',
 }
}
