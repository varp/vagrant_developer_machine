#!/bin/bash

install_mate_desktop()
{
  add-apt-repository "deb http://packages.mate-desktop.org/repo/ubuntu $( lsb_release -cs) main"
  add-apt-repository "deb http://repo.mate-desktop.org/ubuntu $( lsb_release -cs) main"
  add-apt-repository "deb http://mirror1.mate-desktop.org/ubuntu $( lsb_release -cs) main"
  apt-get update

  apt-get install mate-core mate-desktop-environment mate-desktop-environment-extra mate-archive-keyring caja-gksu caja-sendto mate-bluetooth mate-conf-editor mate-indicator-applet mate-media-gstreamer mate-icon-theme-faenza
  
  # apt-get remove gcalctool gnome-screenshot gedit file-roller eog gnome-system-monitor gnome-system-log baobab gnome-terminal gnome-applets gnome-media gnome-power-manager gnome-screensaver

  # Set default desktop for new users:
  /usr/lib/lightdm/lightdm-set-defaults -s mate


  # Change and fix default application for some MIME (file) types
  # Folders:
  xdg-mime default caja-folder-handler.desktop inode/directory
  # SSH sites:
  xdg-mime default caja-folder-handler.desktop x-scheme-handler/ssh
  mateconftool-2 --set --type=bool /desktop/mate/url-handlers/ssh/enabled true
  mateconftool-2 --set --type=string /desktop/mate/url-handlers/ssh/command 'caja "%s"'
  mateconftool-2 --set --type=bool /desktop/mate/url-handlers/ssh/needs_terminal false
  # FTP sites:
  xdg-mime default caja-folder-handler.desktop x-scheme-handler/ftp
  mateconftool-2 --set --type=bool /desktop/mate/url-handlers/ftp/enabled true
  mateconftool-2 --set --type=string /desktop/mate/url-handlers/ftp/command 'caja "%s"'
  mateconftool-2 --set --type=bool /desktop/mate/url-handlers/ftp/needs_terminal false
  # Images:
  xdg-mime default eom.desktop image/bmp
  xdg-mime default eom.desktop image/gif
  xdg-mime default eom.desktop image/jpeg
  xdg-mime default eom.desktop image/x-pcx
  xdg-mime default eom.desktop image/png
  xdg-mime default eom.desktop image/tiff
  # Plain text:
  xdg-mime default pluma.desktop text/plain
  xdg-mime default pluma.desktop text/x-log
  xdg-mime default pluma.desktop application/x-perl
  xdg-mime default pluma.desktop application/javascript
  xdg-mime default pluma.desktop application/rdf+xml
  # If you want for Wine plain text files:
  xdg-mime default pluma.desktop application/x-wine-extension-ini
  xdg-mime default pluma.desktop application/x-wine-extension-vbs
  xdg-mime default pluma.desktop text/x-csrc
  xdg-mime default pluma.desktop application/x-wine-extension-inf
  # PDF:
  xdg-mime default atril.desktop application/pdf

  # Set new default terminal emulator
  update-alternatives --install "$(which x-terminal-emulator)" x-terminal-emulator "$(which mate-terminal)" 30
  update-alternatives --set x-terminal-emulator "$(which mate-terminal)"
}

install_mate_desktop