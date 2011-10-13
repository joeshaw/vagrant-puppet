#!/bin/bash

# Die on any error
set -e

# Change hostname to 'vagrant'
oldname=$(hostname)
hostname vagrant
sed -i -e s/$oldname/vagrant/g /etc/hosts

# Install software
aptitude update
aptitude install -y puppet emacs23-nox git-core

# bind mount /vagrant/puppet into /etc/puppet
mv /etc/puppet /etc/puppet.old
mkdir /etc/puppet
mount --bind /vagrant/puppet /etc/puppet

# optionally run the deploy.sh file if it exists
if [ -x /vagrant/deploy.sh ]; then
    echo "Executing deploy.sh..."
    /vagrant/deploy.sh
fi
