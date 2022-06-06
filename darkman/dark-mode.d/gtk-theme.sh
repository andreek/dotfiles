gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
sed -i 's/"Arc-Darker"/"Arc-Dark"/g' $HOME/.dotfiles/.config/.gtkrc-2.0
sed -i 's/gtk-icon-theme-name = Arc-Darker/gtk-icon-theme-name = Arc-Dark/g' $HOME/.dotfiles/.config/gtk-3.0/settings.ini
sed -i 's/gtk-theme-name = Arc-Darker/gtk-theme-name = Arc-Dark/g' $HOME/.dotfiles/.config/gtk-3.0/settings.ini
sed -i 's/style=Adwaita/style=Adwaita-Dark/g' $HOME/.dotfiles/.config/qt5ct/qt5ct.conf
