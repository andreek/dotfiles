# dotfiles

finally we made it!

## arch dependencies

```shell
sudo pacman -S rofi \
     i3 \ 
     i3lock \
     dbus \
     polybar \
     vim \
     vim-colorschemes \
     clipit \
     deja-dup \
     pulseaudio \
     feh \
     stretchly \
     twmn \
     libinput-gestures \
     wmctrl \
     xdotool \
     xdg-desktop-portal xdg-desktop-portal-kde xdg-desktop-portal-gtk \
     xdg-dbus-proxy \
     qt5ct \
     ttf-font-awesome \
     ttf-patrick-hand-full \
     ttf-roboto-slab \
     ttf-roboto-mono \
     ttf-fira-code \
     alacritty \
     nvim
```

## wayland dependencies

```shell
sudo pacman -S sway \
     swaylock \
     swayidle \
     swaybg \
     sway-contrib \
     waybar \
     mako \
     rofi-wayland \
     xorg-xwayland \
     xdg-desktop-portal \
     xdg-desktop-portal-wlr \
     xdg-desktop-portal-gtk \
     pipewire \
     pipewire-pulse \
     wireplumber \
     grim \
     slurp \
     wl-clipboard \
     ttf-font-awesome \
     ttf-fira-code \
     otf-font-awesome \
     alacritty \
     jq
```

## features

 * i3 + polybar (X11)
 * sway + waybar (Wayland)
 * vim

## install

### desktop

```shell
HOME=<home> REPO=<repo> make all
```

### wayland

```shell
HOME=<home> REPO=<repo> make wayland
```

### vim

```shell
HOME=<home> REPO=<repo> make vim
```

### darkman

```shell
HOME=<home> REPO=<repo> make darkman
```

Add config with your location to `~/.config/darkman/config.yaml`

```yml
lat: <lat>
lng: <lng>
dbusserver: true
```

## clean

```shell
HOME=<home> REPO=<repo> make clean
```

