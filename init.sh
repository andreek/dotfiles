#!/usr/bin/env bash
REPO=/home/andree/dotfiles
HOME=/home/andree
echo "initialising dotfiles.."
mkdir -p $HOME/.config/i3/
ln -s $REPO/.config/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.config/polybar/
ln -s $REPO/.config/polybar/config $HOME/.config/polybar/config
ln -s $REPO/.config/polybar/init.sh $HOME/.config/polybar/init.sh
ln -s $REPO/.config/polybar/pavolume.sh $HOME/.config/polybar/pavolume.sh
mkdir -p $HOME/.config/twmn/
ln -s $REPO/.config/twmn/twmn.conf $HOME/.config/twmn/twmn.conf
ln -s $REPO/.vim $HOME/.vim
mkdir -p $HOME/.vim/undo
ln -s $REPO/.vimrc $HOME/.vimrc
ln -s $REPO/.Xdefaults $HOME/.Xdefaults
