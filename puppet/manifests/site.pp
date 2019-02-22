# A useful trick to manage noop mode via hiera using the key: noop_mode
# This needs the trlinklin-noop module
$noop_mode = lookup('noop_mode', Boolean, 'first', false)
if $noop_mode == true {
  noop()
}

if(!$::role) {
  fail('role fact not set')
}

class { "roles::${::role}": }
