# dotfiles

finally we made it!

## arch dependencies

```shell
sudo pacman -S rofi \
     i3 \ 
     i3lock \
     polybar \
     vim \
     vim-colorschemes \
     clipit \
     deja-dup \
     pulseaudio \
     feh \
     stretchly \
     twmn \
     ttf-font-awesome \
     ttf-patrick-hand-full \
     ttf-roboto-slab
```

## features

 * i3
 * polybar (ttf-font-awesome)
 * vim

## install

### desktop

```shell
HOME=<home> REPO=<repo> make all
```

### vim

```shell
HOME=<home> REPO=<repo> make vim
```

## clean

```shell
HOME=<home> REPO=<repo> make clean
```

