# Base profile, all common resources go here
class profiles::base {

  include ::epel

  class { 'timezone':
    region   => 'Europe',
    locality => 'London',
  }

  class { 'firewall':
    ensure => 'stopped',
  }

}
