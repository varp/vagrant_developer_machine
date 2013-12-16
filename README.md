Vagrant Developer Machine
=========================

Almost always, Vagrant using to build test environment for your projects. Here is and it is anthoer point of view of using Vagrant ecosystem.

We use Vagrant to build custom developing environment using components, like a *devtools/python*, *gui*, *java* etc.

Components of the future developer machine (ecosystem) separated in namespaces. Namespaces is simply folders. Components in turn, consists of modules. Example: *gui* component consists of *xfce.sh* and *gnome3.sh* modules.

Modules are using Vagrant provisioning mechanisms, exactly `shell` provisioning. So, it is simply `shell` (`bash`) scripts, that will executed on `vagrant up`, `vagrant reload` and `vagrant provision` commands.

You can mix components and modules to build your own developer machine that fits your needs and tastes. So, choose your destiny =)

Installation
------------

Requirements:
  * git
  * ruby >= 1.9.3
  * bundle
  * vagrant >= 1.4.0

To install run in shell `git clone https://github.com/varp/vagrant_provision.git`. Change directory to *vagrant_provision*. Run `rake`.

Building
--------
TODO

TODO
----
* ~~assign some kind of priorities to modules (execution order)~~
* ~~$HOME/.config/sublime-text-3 change ownership to user not root~~
* ~~update ruby to 2.0.0; set as default~~
* ~~change permissions and ownership of developer home folder~~
* ~~$HOME/.gvfs permissions~~
* ~~finish.sh script to reconfigure all needed packages~~
* NetworkManager config set managed flag
* to find out which packages install with root rights. fix.