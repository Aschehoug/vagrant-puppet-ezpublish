eZ Publish 5 Virtual Machine
============================
This is a sample setup of Vagrant that uses puppet to provision a virtual
machine running eZ Publish 5.

It's a quick and easy way to check out the a eZ Publish 5 version ( by
default the latest community versions of eZ Publish 5 ) without the
hassle of setting up a specific environment on your machine or in VM.

Warning
------------
The second time you call vagrant up, setup fails with the following output:

    The following SSH command responded with a non-zero exit status.
    Vagrant assumes that this means the command failed!

    /sbin/ifup eth1

    Stdout from the command:



    Stderr from the command:

    stdin: is not a tty
    /etc/network/interfaces:37: interface eth2 declared allow-auto twice
    /sbin/ifup: couldn't read interfaces file "/etc/network/interfaces"

You will then not be able to access the web server. This makes the Vagrant setup useless until fixed.

Requirements
------------
On your local machine install:

- [VirtualBox](http://www.virtualbox.org/wiki/Downloads)
- [Vagrant](http://vagrantup.com/)

Assumes that you have a terminal (ssh / console) and optionally git installed.

Installation
------------
The following steps will set up a Ubuntu 12.04 LTS based VM for development.
The set up process will take some time as there are some large (~400 MB)
downloads. This will only happen the first time this process is run.

### 1. Get the environment
Gets the server configuration (puppet) and VM configuration (Vagrant).

Using GIT, run the following commands:

    git clone git@github.com:brucem/vagrant-puppet-ezpublish.git
    cd vagrant-puppet-ezpublish

OR, download zip archive & extract it:
- Download:
  https://github.com/brucem/vagrant-puppet-ezpublish/archive/master.zip
- Extract the file to a desired location
- Open your console and make sure you are inside the extracted folder

### 2. [Optional] Customize eZ Publish 5 version
If you would like to use another eZ Publish version then the one used by
default, then you can put an .tar.gz file inside the current folder and
customize ezpublish::install instructions in:

  puppet/manifests/ezpublish5_standalone.pp

There is an example of how this is done in the end of the file.


### 3. Start VM and provision
Starts up the VM and sets up the server. Some steps will take some time as
they are downloading & installing packages etc.

    vagrant up

### 4. Visit site
Point you browser at http://33.33.33.10/

You'll be presented with the eZ Publish configuration wizard. eZ Publish can be
installed as per https://confluence.ez.no/display/EZP/The+setup+wizard

**Outgoing Email**  
Select "Sendmail/MTA"  

**Database initialization**  
Servername: localhost  
Username: ezpublish  
Password: password  

Controlling VM once installed
-----------------------------
Once installed you have access to do several operations on the running
VM instance as presented below.

### SSH into the VM
To ssh into the VM run the following command:

    vagrant ssh

eZ Publish can be found in the directory  /var/www/

### Halt VM
The following command will stop the VM:

    vagrant halt

It can be restarted by running:

    vagrant up

### Re installation (with different eZ Publish 5 version)
VM can be reconfigured and re-installed with a different version of eZ Publish
in matters of some minutes once already installed.
You first need to customize eZ Publish 5 version as described in installation
step #2 and then perform the following commands:

    vagrant destroy
    vagrant up


### Uninstall VM & Ubuntu image
The following command will remove the VM completly:

    vagrant destroy

If you also want to remove the box (the Ubunutu 12.04 image) installed:

    vagrant box remove precise32 virtualbox
