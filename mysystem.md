TODO: split this repo into notes and dotfiles separately - but keep this file in with the dot files
This contains a list of software that I like on my system.

I'd like at some point to have a script that takes a base arch linux install and installs all of these while copying over my dotfiles and configurations for all the software, that would be ideal :)

The archinstall script seems to get locales wrong (at least mine) which causes issues. To fix this edit `/etc/locale.gen` so the `GB` locale says `en_GB.UTF-8 UTF-8` and then edit `/etc/locale.conf` and change the contents to `LANG=en_GB.UTF-8` and then reboot the machine.

Dirty fix to weird flickering issue: https://bbs.archlinux.org/viewtopic.php?id=267296
Note I didn't have this issue for a long time - then it suddenly happened. I was changing power settings and ambient sensor stuff as well as enabling blur on picom and all of a sudden it started happening, reverting each of these changes didnt seem to fix it but this dirty fix did - weird

### Core components:

* Display Server: `X11` (with `xinit`,`xclip`)
* Window manager: `i3-gaps`
  * [i3 cheatsheet](https://i3wm.org/docs/refcard.html)
  * [i3 userguide](https://i3wm.org/docs/userguide.html)
  * [i3-gaps guide](https://github.com/Airblader/i3)
* Status bar: `polybar`
* launcher: `rofi`
  * Also use `rofimoji` as emoji picker (needs `xdotool` to work) make sure `noto-fonts-emoji` is installed
* Compositor: `picom`
* Desktop background: `nitrogen`
* Init System: `systemd`
  * Also use for ntp, logging and much more
* Nework Sofware: `NetworkManager`
  * `nm-connection-editor` as a GUI
* Terminal: [`kitty`](https://sw.kovidgoyal.net/kitty/overview/)
* Shell: `bash`
  * install `bash-completion` for completion to work properly
  * install `pkgfile` and run `pkgfile -u` to get told where missing packages are + `systemctl enable pkgfile-update.timer` so it updates automatically
* Display manager: `ly`
* File manager:
  * `pcmanfm` for a GUI
  * [`ranger`](https://github.com/ranger/ranger/wiki/Official-user-guide) for a CLI based (install `python-pillow` for image preview)
* Bootloader: `grub`
* Audio: `pipewire`
  * Controlling audio with: `alsa`, `amixer`, `alsamixer` (can probably find something better), `gnome alsa mixer`
* Screen locker:
  * `i3-lock-color`
  * `xss-lock`
  * `xidle-hook`
* Polkit: `polkit`,`lxqt-policykit`,`polkit-explorer-git`
* notifications: `dunst`


### Other (less) major bits of system software:

* `sudo`
* `man-db` - manual pages
* `tldr` - shorter man pages
* `yay` - AUR helper
* `xdg-open`
* `greenclip` - clipboard manager with rofi (AUR `rofi-greenclip`)
* `acpi` - battery info
* `papirus-icon-theme` from AUR
* bluetooth stuff - `bluez`, `bluez-utils` gives `bluetoothctl` which does almost everything, `blueman`
* touchpad control - `xinput` `xinput --set-prop`
* brightness tool - `brightnessctl`, `light`
* power - `tlp` `powertop` `xfce4-power-manager`? (https://community.frame.work/t/linux-battery-life-tuning/6665/174?page=8)

### Other 'normal' software

* `git`
* `vim` (https://www.youtube.com/watch?v=_NUO4JEtkDw)
* `neovim` (TODO: configure it)
* `plocate`
* calculator - `kcalc` GUI or `python` interpreter
* font-manager - `font-manager`
* fonts: `nerd-fonts`, `adobe-source-code-pro-fonts`, `opensans`, `notosans`,`freesans`,`freemono`, `JetBrainsMono`
* Media player - `vlc`,(+ `libmicrodns`,`protobuf` for chromecast) (use `mpv` as a backup)
* Image viewer - `qview` (AUR)
* pdf viewer - `zathura`,`zathura-pdf-mupdf`,`zathura-cb`,`zathura-djvu`, `Evince`
* debugger - `seer` `gdbfrontend` `gdbgui` + try a non-graphical one like `cgdb` `gdbtui` or just `gdb` to learn about them
* IDE - `neovim` `vscode`
* browser - `firefox`
* office suite - `libreoffice`
* screenshot tool - `flameshot`
* hexeditor - `imhex`
* system/process monitor - `conky` `htop`
* virtual machines - `virtualbox`, `qemu` + `virtmanager`
* color picker - `kcolorchooser`
* screen recorder - `peek` for quick small gifs/vids, `obs-studio` for full recording
* music - `spotify`, `playerctl` to control it with bindings,rofi etc
* disk usage display - `filelight`
* chat - `discord`
* developer tools - `binutils` `cmake` `valgrind` `kcachegrind` `wireshark`
* image editor - `gimp`
* System information viewer - `neofetch`
* text to ascii art - `figlet`
* disk partitioner - `cfdisk`
* diff tool - `meld` (should I?) `vimdiff`
* git gui - `vscode` or `vim` - can't find an OSS good gui
* rss reader - `liferea`
* notes - `joplin`
* todo tool - `devtodo` (AUR)
* webcam software - cheese?

### Can only do once on laptop

* make multimonitor support work (might need to use `xrandr` to get it working - use rofi for menu - https://www.youtube.com/watch?v=wu2NWw2wPaA)
* autobrightness with ambient light sensor `monitor-sensor` `/sys/bus/iio/devices/iio:device0/in_illuminance_raw`

### Software to consider in future

* Have an easy way to skip bootloader + display manager to boot faster
* `feh` instead of nitrogen
* Different shells instead of `bash` like `zsh` or `fish`
* `alacritty` instead of `kitty`
* `starship` to customise shell prompt
* Consider not using a display manager and going straight into the wm
* Give CLion, QtCreator a try

### Notes

* [arch wiki on framework](https://wiki.archlinux.org/title/Framework_Laptop)
* [This archwiki about autostarting](https://wiki.archlinux.org/title/Autostarting) is interesting about getting stuff to run in the background automatically at the right 'scope'.
