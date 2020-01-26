#!/usr/bin/env bash
REPO=/home/andree/dotfiles
HOME=/home/andree
echo "initialising dotfiles.."
mkdir -p $HOME/.config/i3/
ln -s $REPO/.config/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.config/polybar/
ln -s $REPO/.config/polybar/config $HOME/.config/polybar/config
ln -s $REPO/.config/polybar/init.sh $HOME/.config/polybar/init.sh
ln -s $REPO/.config/polybar/bar_dockedx1 $HOME/.config/polybar/bar_dockedx1
ln -s $REPO/.config/polybar/bar_main $HOME/.config/polybar/bar_main
ln -s $REPO/.config/polybar/bar_plug $HOME/.config/polybar/bar_plug
ln -s $REPO/.config/polybar/bar_x1 $HOME/.config/polybar/bar_x1
ln -s $REPO/.config/polybar/main_left $HOME/.config/polybar/main_left
ln -s $REPO/.config/polybar/pavolume.sh $HOME/.config/polybar/pavolume.sh
mkdir -p $HOME/.config/twmn/
ln -s $REPO/.config/twmn/twmn.conf $HOME/.config/twmn/twmn.conf
ln -s $REPO/.vim $HOME/.vim
mkdir -p $HOME/.vim/undo
ln -s $REPO/.vimrc $HOME/.vimrc
ln -s $REPO/.Xdefaults $HOME/.Xdefaults
mkdir -p $HOME/.local/bin/
ln -s $REPO/scripts/screens.sh $HOME/.local/bin/
ln -s $REPO/scripts/dock.sh $HOME/.local/bin/
