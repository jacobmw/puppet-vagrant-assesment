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

$motd_template = @(END)
<%= $facts[operatingsystem] %> <%= $facts[operatingsystemrelease] %> <%= $facts[architecture] %>

FQDN:         <%= $facts[fqdn] %>
Processor:    <%= $facts[processor0] %>
Kernel:       <%= $facts[kernel] %>
Memory Free:  <%= $facts[memoryfree] %>
Hostname:     <%= $facts[hostname] %>
IP Address:   <%= $facts[ipaddress] %>
Role:         Go Web App
END

class { 'motd':
	content => inline_epp($motd_template,)
}
