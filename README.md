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

To install run in shell `git clone https://github.com/varp/vagrant_provision.git`.

Building
--------
To build with default set of components and modules: `cd vagrant_provision && rake`. Default set of components include `system/hostname system/repo_yandex system/user deps/* devtools/git devtools/vim configs/locales`.

To build machine with custom set of components and modules:
```
cd vagrant_provision
rake clean
rake init
rake gen['system/* deps/* gui/xfce gui/ubuntu_fonts devtools/* configs/locales'] 
# components list must be separated by spaces
# to include all modules within a component use asterisk, ex. `system/*`
# to include separate modules within component, ex. `devtools/git devtools/vim`
rake build
rake reload
rake configure
```

TODO
----
* ~~assign some kind of priorities to modules (execution order)~~
* ~~$HOME/.config/sublime-text-3 change ownership to user not root~~
* ~~update ruby to 2.0.0; set as default~~
* ~~change permissions and ownership of developer home folder~~
* ~~$HOME/.gvfs permissions~~
* ~~finish.sh script to reconfigure all needed packages~~
* perl packages install; cpan configure
* NetworkManager config set managed flag
* to find out which packages install with root rights. fix.
* Change to user developer in scripts, to install ex: sublime3, rvm to proper directories
