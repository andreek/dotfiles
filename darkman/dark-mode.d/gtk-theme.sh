gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
sed -i 's/"Arc-Darker"/"Arc-Dark"/g' $HOME/.gtkrc-2.0
sed -i 's/Arc-Darker/Arc-Dark/g' $HOME/.config/gtk-3.0/settings.ini
sed -i 's/Adwaita/Adwaita-Dark/g' $HOME/.config/qt5ct/qt5ct.conf
