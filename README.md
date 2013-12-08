Vagrant Developer Machine
=========================

Almost always, Vagrant using to build test environment for your projects. Here is and it is anthoer point of view of using Vagrant ecosystem.

We use Vagrant to build custom developing environment using components, like a *devtools/python*, *gui*, *java* etc.

Components of the future developer machine (ecosystem) separated in namespaces. Namespaces is simply folders. Components in turn, consists of modules. Example: *gui* component consists of *xfce.sh* and *gnome3.sh* modules.

Modules are using Vagrant provisioning mechanisms, exactly `shell` provisioning. So, it is simply `shell` (`bash`) scripts, that will executed on `vagrant up`, `vagrant reload` and `vagrant provision` commands.

You can mix components and modules to build your own developer machine that fits your needs and tastes. So, choose your destiny =)

Installation
------------
TODO

Building
--------
TODO
