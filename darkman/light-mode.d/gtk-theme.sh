#sed -i 's/"Arc-Dark"/"Arc-Darker"/g' $HOME/.dotfiles/.config/.gtkrc-2.0
sed -i 's/gtk-icon-theme-name = Arc-Dark/gtk-icon-theme-name = Arc-Darker/g' $HOME/.config/gtk-3.0/settings.ini
sed -i 's/gtk-theme-name = Arc-Dark/gtk-theme-name = Arc-Darker/g' $HOME/.config/gtk-3.0/settings.ini
#sed -i 's/gtk-icon-theme-name = Arc-Dark/gtk-icon-theme-name = Arc-Darker/g' $HOME/.config/gtk-4.0/settings.ini
#sed -i 's/gtk-theme-name = Arc-Dark/gtk-theme-name = Arc-Darker/g' $HOME/.config/gtk-4.0/settings.ini
sed -i 's/style=Adwaita-Dark/style=Adwaita/g' $HOME/.dotfiles/.config/qt5ct/qt5ct.conf
/usr/bin/gsettings set org.gnome.desktop.interface gtk-theme Arc-Darker
/usr/bin/gsettings set org.gnome.desktop.interface color-scheme prefer-light
