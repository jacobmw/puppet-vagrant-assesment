# puppet-assessment
A simple Puppet assessment skeleton using vagrant.
Thanks to https://github.com/timbirk/puppet-assessment for original work

**First step: fork this repo, then clone your fork to work on.**
When you are done, commit your changes and share your repo

## Software Required

You will need to install Vagrant and Virtualbox to run the technical assessment. If you have the vagrant plugin 'vagrant-vbguest' installed, you should remove that first to speed things up.

[Git](https://git-scm.com/)
[Vagrant](https://www.vagrantup.com)
[Virtualbox](https://www.virtualbox.org/)

## Overview

Everything in this repo works... eventually. There are deliberate problems which
often occur in the real world to solve before things do get up and running.

Running `vagrant up` should build and run an app named `go-webapp` which is
written in golang. The app deliberately takes a while to respond to a request,
it does this using a `sleep` but imagine in the real world a slow query or some
_Big Data Machine Learning_ algorithm is working to get some results.

Once you get `vagrant up` running you should be able to `vagrant ssh` into the
VM instance and `curl localhost:8484` eventually the app will give you some
output.

## Expectations

After overcoming the issues to get things running, there's a few things you
should try to achieve.

### Where am I?

Imagine you have hundreds or even thousands of instances, the larger the number
of instances, the greater the risk of potentially logging into the wrong
instance and doing something potentially CV altering becomes.

**Add something that will display the hostname and role of the machine on
login. This should be consistent on all future instances.**

### Keep on running

Currently, the application is run with an exec and backgrounds the process.
Although this works, it's not a very good thing to do (seriously, it's awful).

**Find a way to run go-webapp that allows us to check the status of the service
and start, stop or restart it. The go-webapp should be running and startup if the
instance were rebooted. The go-webapp should automatically restart on error.**

### Stop repeating yourself

Good puppet code should require only a single run to achieve the desired state.
Good puppet code should not re-apply changes repetitively on subsequent runs.

You can run Puppet again using the `vagrant provision` command.

**Prevent resources from re-applying or executing on every puppet run. Let's assume
that the go-webapp application only needs to be built once in the lifetime of
the instance.**

## Expected results

On completion of the above (you may need to do one or more extra things), the
expectation is that you should be able to go to http://localhost:8080 in your
web browser and get some output. You should be able to refresh the page and get
an almost instant response back.

## Bonus points

Add some form of logging of requests.

## Other considerations for disscussion / thinking about

How would you make sure the application is secure, is there anything in particular to
worry about? 

Updates on OS. Need patches for security vulnerabilities etc.
Firewall is disabled. Need to set restricted rules.


How would you know if the app was working or not? 
Need a script to confirm status. Build should run some sanity tests.

What would you change or
advise the potential client or dev team to change or think about?
Firewall, yum updates, go modules for dependency pulling... building binary ahead of time and just providing a tar or gzip with the binary
Have the application run through a docker image and run it on the instance with the appropriate network config

