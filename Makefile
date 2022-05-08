.PHONY: all clean cleanvim cleangtk desktop i3 polybar twmn vim scripts darkman libinput gtk

ifeq ($(strip $(REPO)),)
REPO := /home/andree/.dotfiles
endif
ifeq ($(strip $(HOME)),)
HOME := /home/andree
endif

all: vim desktop

desktop: i3 polybar scripts twmn darkman libinput gtk

i3:
	ln -s ${REPO}/.config/i3 ${HOME}/.config/i3
	ln -s ${REPO}/.Xdefaults ${HOME}/.Xdefaults
	ln -s ${REPO}/.xinitrc ${HOME}/.xinitrc

gtk:
	ln -s ${REPO}/.config/.gtkrc-2.0 ${HOME}/.gtkrc-2.0
	ln -s ${REPO}/.config/gtk-3.0 ${HOME}/.config/gtk-3.0
	ln -s ${REPO}/.config/qt5ct ${HOME}/.config/qt5ct

libinput:
	ln -s ${REPO}/.config/libinput-gestures.conf ${HOME}/.config/libinput-gestures.conf

darkman:
	mkdir -p ${HOME}/.local/share
	ln -s ${REPO}/darkman/light-mode.d ${HOME}/.local/share/
	ln -s ${REPO}/darkman/dark-mode.d ${HOME}/.local/share/
	systemctl --user enable --now darkman.service

polybar:
	ln -s ${REPO}/.config/polybar ${HOME}/.config/polybar

scripts:
	mkdir -p ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/screens.sh ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/dock.sh ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/containers.sh ${HOME}/.local/bin/

twmn:
	mkdir -p ${HOME}/.config/twmn/
	ln -s ${REPO}/.config/twmn/twmn.conf ${HOME}/.config/twmn/twmn.conf

vim:
	git -C ${REPO} submodule init
	git -C ${REPO} submodule update
	ln -s ${REPO}/.vim ${HOME}/.vim
	mkdir -p ${HOME}/.vim/undo
	ln -s ${REPO}/.vimrc ${HOME}/.vimrc

clean: cleanvim
	rm -rf ${HOME}/.config/i3
	rm -rf ${HOME}/.config/polybar
	rm -rf ${HOME}/.config/twmn
	rm -rf ${HOME}/.config/libinput-gestures.conf
	rm -rf ${HOME}/.Xdefaults
	rm -rf ${HOME}/.xinitrc
	rm -rf ${HOME}/.local/bin/screens.sh
	rm -rf ${HOME}/.local/bin/dock.sh
	rm -rf ${HOME}/.local/bin/containers.sh

cleangtk:
	rm -rf ${HOME}/.gtkrc-2.0
	rm -rf ${HOME}/.config/gtk-3.0
	rm -rf ${HOME}/.config/qt5ct

cleanvim:
	rm -rf ${HOME}/.vim
	rm -rf ${HOME}/.vimrc
