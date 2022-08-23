TODO: split this repo into notes and dotfiles separately - but keep this file in with the dot files
This contains a list of software that I like on my system.

I'd like at some point to have a script that takes a base arch linux install and installs all of these while copying over my dotfiles and configurations for all the software, that would be ideal :)

The archinstall script seems to get locales wrong (at least mine) which causes issues. To fix this edit `/etc/locale.gen` so the `GB` locale says `en_GB.UTF-8 UTF-8` and then edit `/etc/locale.conf` and change the contents to `LANG=en_GB.UTF-8` and then reboot the machine.

### Core components:

* Display Server: `X11` (with `xinit`,`xclip`)
* Window manager: `i3-gaps`
  * [i3 cheatsheet](https://i3wm.org/docs/refcard.html)
  * [i3 userguide](https://i3wm.org/docs/userguide.html)
  * [i3-gaps guide](https://github.com/Airblader/i3)
  * [`pywal`](https://github.com/dylanaraps/pywal/wiki) for theming in an easy way (the wiki has ways to setup it up nicely)
* Status bar: `polybar`
* launcher: `rofi` (TODO: fully customisze using a theme)
  * Also use `rofimoji` as emoji picker (needs `xdotool` to work) make sure `noto-fonts-emoji` is installed
* Compositor: `picom`
  * TODO: See if blur works with glx backend on real hardware
* Desktop background: `nitrogen`
* Init System: `systemd`
  * Also use for ntp, logging and much more
* Nework Sofware: `NetworkManager`
* Terminal: [`kitty`](https://sw.kovidgoyal.net/kitty/overview/)
* Shell: `bash`
  * install `bash-completion` for completion to work properly
  * install `pkgfile` and run `pkgfile -u` to get told where missing packages are + `systemctl enable pkgfile-update.timer` so it updates automatically
* Display manager: `lightdm`
  * use `lightdm-webkit2-greeter` with [`aether theme`](https://github.com/NoiSek/Aether)
* File manager:
  * `pcmanfm` for a GUI
  * [`ranger`](https://github.com/ranger/ranger/wiki/Official-user-guide) for a CLI based (install `python-pillow` for image preview)
* Bootloader: `grub`
* Audio: `pulseaudio`
  * if i seem to have issues - try `pipewire` 
* Screen locker:
  * `i3-lock-color`
  * `xss-lock`
* Polkit: `polkit`,`lxqt-policykit`,`polkit-explorer-git`
* notifications: `dunst`


### Other (less) major bits of system software:

* `sudo`
* `man-db`
* `yay` - AUR helper
* `xdg-open` (look into)
* clipboard manager? `copyq`?
* auto-cpufreq for power? ([power management in general](https://wiki.archlinux.org/title/Power_management))
* `papirus-icon-theme` from AUR

### Other 'normal' software

* `git`
* `vim`
* TODO: `neovim`?
* `locate` (TODO: setup)
* `tldr`
* calculator: kcalc?
* `font-manager` for managing fonts
* fonts: `nerd-fonts`
* Media player: VLC or mpv?
* Image viewer: viewnior?
* pdf viewer: mupdf?
* debugger: Seer? gdbfrontend?
* IDE: vscode?/qtcreator?/clion?/neovim?
* browser: firefox?
* keychain?/password manager?:
* libreoffice?
* discord/spotify
* music cmus? deadbeef? mpd + mpd in polybar?
* screenshot tool? maim/scrot?
* qemu/virtualbox?
* gcc/binutils + other dev tools like curl/wget cmake kcachegrind valgrind
* google drive drivesync?
* volume control? like kmix?
* webcam software - cheese?
* kompare diff tool?
* hexeditor?
* conky - system monitor? stacer
* filelight - disk usage display?
* System information viewers - like neofetch?
* dnote/joplin for notes? devtodo for todos?
* Pomodoro timer? tomato?
* Touch typing software?
* figlet!
* peek - screen recorder?
* cfdisk
* htop
* gimp

### Can only do once on laptop

* Setup volume, brightness, bluetooth and wifi on polybar (maybe have notifications when these change)
* Setup bluetooth manageer (blueman)
* Proper power settings `cpupower` `powertop` (https://community.frame.work/t/linux-battery-life-tuning/6665/174?page=8)
* fprint for finger print?
* `bluez`,`bluez-utils` and [polybar](https://github.com/msaitz/polybar-bluetooth) for [bluetooth](https://wiki.archlinux.org/title/bluetooth)
* make multimonitor support work (might need to use `xrandr` to get it working)

### Software to consider in future

* Have an easy way to skip bootloader + display manager to boot faster
* [`wpgtk`](https://github.com/deviantfero/wpgtk/wiki/Installation) to manage `pywal` themes
* `feh` instead of nitrogen
* Different shells instead of `bash` like `zsh` or `fish`
* `alacritty` instead of `kitty`
* `starship` to customise shell prompt
* Consider not using a display manager and going straight into the wm

### Notes

* [arch wiki on framework](https://wiki.archlinux.org/title/Framework_Laptop)
* [This archwiki about autostarting](https://wiki.archlinux.org/title/Autostarting) is interesting about getting stuff to run in the background automatically at the right 'scope'.
