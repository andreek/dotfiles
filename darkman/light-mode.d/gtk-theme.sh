gsettings set org.gnome.desktop.interface gtk-theme Arc-Darker
gsettings set org.gnome.desktop.interface color-scheme prefer-light
sed -i 's/"Arc-Dark"/"Arc-Darker"/g' $HOME/.gtkrc-2.0
sed -i 's/Arc-Dark/Arc-Darker/g' $HOME/.config/gtk-3.0/settings.ini
sed -i 's/Adwaita-Dark/Adwaita/g' $HOME/.config/qt5ct/qt5ct.conf
