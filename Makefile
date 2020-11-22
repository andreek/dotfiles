.PHONY: all clean cleanvim desktop i3 polybar twmn vim scripts

ifeq ($(strip $(REPO)),)
REPO := /home/andree/.dotfiles
endif
ifeq ($(strip $(HOME)),)
HOME := /home/andree
endif

all: vim desktop

desktop: i3 polybar scripts twmn

i3:
	ln -s ${REPO}/.config/i3 ${HOME}/.config/i3
	ln -s ${REPO}/.Xdefaults ${HOME}/.Xdefaults

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
	rm -rf ${HOME}/.Xdefaults
	rm -rf ${HOME}/.local/bin/screens.sh
	rm -rf ${HOME}/.local/bin/dock.sh
	rm -rf ${HOME}/.local/bin/containers.sh

cleanvim:
	rm -rf ${HOME}/.vim
	rm -rf ${HOME}/.vimrc
