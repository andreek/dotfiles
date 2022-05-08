gsettings set org.gnome.desktop.interface gtk-theme Arc-Darker
gsettings set org.gnome.desktop.interface color-scheme prefer-light
sed -i 's/"Arc-Dark"/"Arc-Darker"/g' $HOME/.dotfiles/.config/.gtkrc-2.0
sed -i 's/Arc-Dark/Arc-Darker/g' $HOME/.dotfiles/.config/gtk-3.0/settings.ini
sed -i 's/Adwaita-Dark/Adwaita/g' $HOME/.dotfiles/.config/qt5ct/qt5ct.conf
