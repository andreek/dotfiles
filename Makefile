.PHONY: all alacritty clean cleanvim cleangtk cleanalacritty cleanwayland desktop wayland i3 polybar sway waybar mako portal twmn vim nvim scripts darkman libinput gtk

ifeq ($(strip $(REPO)),)
REPO := /home/andree/.dotfiles
endif
ifeq ($(strip $(HOME)),)
HOME := /home/andree
endif

all: vim nvim desktop

desktop: i3 polybar scripts twmn darkman libinput gtk alacritty

wayland: sway waybar mako portal

i3:
	ln -s ${REPO}/.config/i3 ${HOME}/.config/i3
	ln -s ${REPO}/.Xdefaults ${HOME}/.Xdefaults
	ln -s ${REPO}/.xinitrc ${HOME}/.xinitrc

gtk:
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

sway:
	mkdir -p ${HOME}/.config/sway/config.d
	ln -s ${REPO}/.config/sway/config ${HOME}/.config/sway/config
	ln -sf ${REPO}/.config/sway/config.d/$(hostname -s).conf ${HOME}/.config/sway/config.d/host.conf

waybar:
	mkdir -p ${HOME}/.config/waybar
	ln -s ${REPO}/.config/waybar/config.jsonc ${HOME}/.config/waybar/config
	ln -s ${REPO}/.config/waybar/style.css ${HOME}/.config/waybar/style.css

mako:
	mkdir -p ${HOME}/.config/mako
	ln -s ${REPO}/.config/mako/config ${HOME}/.config/mako/config

portal:
	mkdir -p ${HOME}/.config/xdg-desktop-portal
	ln -s ${HOME}/.config/xdg-desktop-portal/portals.conf ${HOME}/.config/xdg-desktop-portal/portals.conf

scripts:
	mkdir -p ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/screens.sh ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/dock.sh ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/containers.sh ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/trackpad-battery.sh ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/switchaudio.sh ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/switchlang.sh ${HOME}/.local/bin/
	ln -s ${REPO}/scripts/wcontainers.sh ${HOME}/.local/bin/

twmn:
	mkdir -p ${HOME}/.config/twmn/
	ln -s ${REPO}/.config/twmn/twmn.conf ${HOME}/.config/twmn/twmn.conf

vim:
	git -C ${REPO} submodule init
	git -C ${REPO} submodule update
	ln -s ${REPO}/.vim ${HOME}/.vim
	mkdir -p ${HOME}/.vim/undo
	ln -s ${REPO}/.vimrc ${HOME}/.vimrc

vim-server: vim
	rm ${HOME}/.vimrc
	git -C ${REPO} submodule init
	git rm -f .vim/pack/syntax/start/coc
	git -C ${REPO} submodule update
	ln -s ${REPO}/.vimrc-server ${HOME}/.vimrc

nvim:
	ln -s ${REPO}/nvim ${HOME}/.config/nvim

alacritty:
	ln -s ${REPO}/alacritty ${HOME}/.config/alacritty

clean: cleanvim cleanalacritty
	rm -rf ${HOME}/.config/i3
	rm -rf ${HOME}/.config/polybar
	rm -rf ${HOME}/.config/twmn
	rm -rf ${HOME}/.config/libinput-gestures.conf
	rm -rf ${HOME}/.Xdefaults
	rm -rf ${HOME}/.xinitrc
	rm -rf ${HOME}/.local/bin/screens.sh
	rm -rf ${HOME}/.local/bin/dock.sh
	rm -rf ${HOME}/.local/bin/containers.sh
	rm -rf ${HOME}/.local/bin/trackpad-battery.sh
	rm -rf ${HOME}/.local/bin/switchaudio.sh
	rm -rf ${HOME}/.local/bin/switchlang.sh
	rm -rf ${HOME}/.local/bin/wcontainers.sh

cleangtk:
	rm -rf ${HOME}/.config/qt5ct

cleanvim:
	rm -rf ${HOME}/.vim
	rm -rf ${HOME}/.vimrc
	rm -rf ${HOME}/.config/nvim

cleanalacritty:
	rm -rf ${HOME}/.config/alacritty

cleanwayland:
	rm -rf ${HOME}/.config/sway
	rm -rf ${HOME}/.config/waybar
	rm -rf ${HOME}/.config/mako
	rm -rf ${HOME}/.config/xdg-desktop-portal
