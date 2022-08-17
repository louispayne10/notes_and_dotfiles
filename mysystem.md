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
* launcher: `rofi`
  * Also use `rofimoji` as emoji picker (needs `xdotool` to work) make sure `noto-fonts-emoji` is installed
* Compositor: `xcompmgr`
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

### Other (less) core bits of software:
* `git`
* `vim`
  * TODO: `neovim`?
* `sudo`
* `man-db`
* `bluez`,`bluez-utils` and [polybar](https://github.com/msaitz/polybar-bluetooth) for [bluetooth](https://wiki.archlinux.org/title/bluetooth)
* `yay` as an AUR helper?
* `xdg-open`

### Unknowns

* polkit: lxqt-policykit?
* notifications?: dunst?
* clipboard manager? clipmenu?

* calculator: kcalc?
* font viewer (`font-manager`)
* Media player: VLC or mpv?
* Image viewer: viewnior?
* pdf viewer: mupdf?
* debugger: Seer? gdbfrontend?
* IDE: vscode?
* browser: firefox?
* keychain?/password manager?:
* auto-cpufreq for power? ([power management in general](https://wiki.archlinux.org/title/Power_management))
* libreoffice?
* discord/spotify
* music cmus? deadbeef?
* screenshot tool? maim/scrot?
* qemu/virtualbox?
* gcc/binutils + other dev tools like curl/wget cmake kcachegrind valgrind
* fprint for finger print?
* google drive drivesync?
* volume control? like kmix?
* webcam software - cheese?
* kompare diff tool?
* hexeditor?
* conky - system monitor? stacer
* filelight - disk usage display?
* System information viewers - like neofetch?
* dnote for notes? devtodo for todos?
* Pomodoro timer? tomato?
* Touch typing software?
* figlet!
* peek - screen recorder?
* cfdisk
* htop
* gimp

### Can only do once on laptop

* Setup brightness, bluetooth and wifi on polybar
* Setup bluetooth manageer (blueman)
* Proper power settings
* fprint

### Software to consider in future

* [`wpgtk`](https://github.com/deviantfero/wpgtk/wiki/Installation) to manage `pywal` themes
* More advanced compositors like `picom` as `xcompmgr` is very simple
* `feh` instead of nitrogen
* Different shells instead of `bash` like `zsh`
* `alacritty` instead of `kitty`
* `starship` to customise shell prompt
* Consider not using a display manager and going straight into the wm

### Notes

* [arch wiki on framework](https://wiki.archlinux.org/title/Framework_Laptop)
* [This archwiki about autostarting](https://wiki.archlinux.org/title/Autostarting) is interesting about getting stuff to run in the background automatically at the right 'scope'.
