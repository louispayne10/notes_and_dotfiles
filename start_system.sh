#!/bin/bash

# Install vim and git when installing arch
# clone the repo and run this to get the system into a good state

set -xe

cd ~

# install all packages we need from pacman
sudo pacman -S --needed --noconfirm base-devel git vim kitty polybar rofi noto-fonts-emoji xdotool picom nitrogen \
  bash-completion pkgfile pcmanfm ranger xss-lock polkit lxqt-policykit dunst man-db tldr neovim plocate \
  font-manager python nerd-fonts adobe-source-code-pro-fonts ttf-opensans noto-fonts gnu-free-fonts vlc \
  libmicrodns protobuf mpv firefox libreoffice flameshot htop binutils rofimoji zathura zathura-pdf-mupdf \
  zathura-cb zathura-djvu peek python-pip kcalc gdb conky kcolorchooser cmus cmake discord \
  gimp neofetch figlet clang ttf-iosevka-nerd nerd-fonts-complete brightnessctl bluez bluez-utils blueman \
  xinput ttf-jetbrains-mono alsa-utils acpi arch-wiki-docs bison cmake conky discord fprintd gnome-clocks \
  gnome-weather gimp iio-sensor-proxy iftop inetutils libc++ liferea light lxappearance ninja neovim powerline-fonts \
  powertpo tlp tree ttf-hack ttf-fira-code ttf-jetbrains-mono ttf-opensans unzip xautolock xfce4-power-manager xorg-server \
  xorg-xbacklight xorg-xev xorg-xinit xorg-xinput xss-lock

if [ ! -d "notes_and_dotfiles" ]; then
  git clone https://github.com/louispayne10/notes_and_dotfiles.git
fi
if [ ! -d "wallpapers" ]; then
  git clone https://github.com/louispayne10/wallpapers.git
fi

# get yay our AUR helper
if [ ! -d "yay" ]; then
  git clone https://aur.archlinux.org/yay.git
  (cd yay && makepkg -si --noconfirm)
fi

# install AUR packages
yay -S --needed ly i3lock-color rofi-greenclip papirus-icon-theme qview devtodo visual-studio-code-bin \
  deadbeef gnome-alsamixer nerd-fonts-complete spotify vim-plug xidlehook

# create the screenshots directory for flameshot
mkdir screenshots || true

# move over our dotfiles
cp -a notes_and_dotfiles/dotfiles/. ./

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

# set a wallpaper
nitrogen --set-centered --save wallpapers/1920x1080/001-gruv-pacman-ghosts.png

if [ -z "fdksl"] fklsd;
    a
