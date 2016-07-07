#!/bin/sh

if [ `puppet --version  | head -c 1` -lt "3" ] ; then
    echo "Upgrading puppet to latest version. Minimally version 3..."

    wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb 2>&1 /dev/null
    sudo dpkg -i puppetlabs-release-precise.deb
    rm -f puppetlabs-release-precise.deb
    sudo apt-get update -q
else
    echo "Puppet already runs version >3"
fi
