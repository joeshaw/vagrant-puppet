This is a sample [Vagrant](http://vagrantup.com) configuration for
testing [Puppet](http://puppetlabs.com) deployments in an Ubuntu Lucid
box.

The scripts assume that your base box is Ubuntu Lucid (10.04 LTS), and
although it should work on 32- or 64-bit distributions, I have only
tested it on 64-bit.  You may need to change the `config.vm.box`
setting in the Vagrantfile.

It also assumes that there exists a `puppet` directory under this one
that contains your puppet configuration.  I check out my puppet git
repo into that directory.

When the VM is provisioned, a few packages are installed, the hostname
configuration is tweaked, and `/vagrant/puppet` is bind-mounted onto
`/etc/puppet`.  This means you can run `puppet apply` normally without
needing to mess with `--modulepath`.

Joe Shaw <<joe@joeshaw.org>>