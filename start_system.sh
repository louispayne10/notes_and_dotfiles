#!/bin/bash

# Install vim and git when installing arch
# clone the repo and run this to get the system into a good state

set -xe

# install all packages we need from pacman
sudo pacman -S --needed base-devel git vim kitty polybar rofi noto-fonts-emoji xdotool picom nitrogen \
  bash-completion pkgfile pcmanfm ranger xss-lock polkit lxqt-policykit dunst man-db tldr neovim plocate \
  font-manager python nerd-fonts adobe-source-code-pro-fonts ttf-opensans noto-fonts gnu-free-fonts vlc \
  libmicrodns protobuf mpv firefox libreoffice flameshot htop binutils rofimoji zathura zathura-pdf-mupdf \
  zathura-cb zathura-djvu peek python-pywal python-pip kcalc gdb conky kcolorchooser cmus cmake discord \
  gimp neofetch figlet clang ttf-iosevka-nerd

if [ ! -d "notes_and_dotfiles" ]; then
  git clone https://github.com/louispayne10/notes_and_dotfiles.git
fi
if [ ! -d "wallpapers" ]; then
  git clone https://github.com/louispayne10/wallpapers.git
fi

# get yay our AUR helper
if [ ! -d "yay" ]; then
  git clone https://aur.archlinux.org/yay.git
  (cd yay && makepkg -si)
fi

# install AUR packages
yay -S --needed ly i3lock-color rofi-greenclip papirus-icon-theme qview devtodo visual-studio-code-bin \
  deadbeef tomato-git

# create the screenshots directory for flameshot
mkdir screenshots || true

# move over our dotfiles
cp notes_and_dotfiles/dotfiles .

# enable ly as a display manager
sudo systemctl disable lightdm.service
sudo systemctl enable ly.service

# use pkgfile so pacman suggests which packages applications can be found in
sudo pkgfile -u
sudo systemctl enable pkgfile-update.timer

# enable systemd timer for plocate and update the db right now
sudo updatedb
sudo systemctl enable --now plocate-updatedb.timer

# for displaying images in ranger
pip install pillow

# set a wallpaper + theme
wal -i wallpapers/1024x768/005-spaceman_forest.jpg

