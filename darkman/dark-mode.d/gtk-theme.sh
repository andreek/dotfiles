#!/usr/bin/env bash
sed -i 's/style=Adwaita/style=Adwaita-Dark/g' "HOME/.dotfiles/.config/qt5ct/qt5ct.conf"
/usr/bin/gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
/usr/bin/gsettings set org.gnome.desktop.interface color-scheme prefer-dark
