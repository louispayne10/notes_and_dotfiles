TODO: split this repo into notes and dotfiles separately - but keep this file in with the dot files
TODO: create a wallpapers repo
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
  * TODO: setup keybindings to launch main pieces of software e.g browser
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
  * TODO: try a lighter weight one?
* File manager:
  * `pcmanfm` for a GUI
  * [`ranger`](https://github.com/ranger/ranger/wiki/Official-user-guide) for a CLI based (install `python-pillow` for image preview)
* Bootloader: `grub`
* Audio: `pipewire`
* Screen locker:
  * `i3-lock-color`
  * `xss-lock`
  * TODO: configure autolock time + make sure it doesnt do it while audio is playing or fullscreen
* Polkit: `polkit`,`lxqt-policykit`,`polkit-explorer-git`
* notifications: `dunst`


### Other (less) major bits of system software:

* `sudo`
* `man-db` - manual pages
* `tldr` - shorter man pages
* `yay` - AUR helper
* `xdg-open`
* `greenclip` - clipboard manager with rofi (AUR `rofi-greenclip`)
* auto-cpufreq for power? ([power management in general](https://wiki.archlinux.org/title/Power_management))
* `papirus-icon-theme` from AUR

### Other 'normal' software

* `git`
* `vim` (https://www.youtube.com/watch?v=_NUO4JEtkDw) (`xset` to change repeat delay)
* `neovim` (TODO: configure it)
* `plocate` (make sure to enable to systemd service)
* `tldr`
* calculator - `kcalc` GUI or `python` interpreter
* font-manager - `font-manager`
* fonts: `nerd-fonts`, `adobe-source-code-pro-fonts`, `opensans`, `notosans`,`freesans`,`freemono`
* Media player - `vlc`,(+ `libmicrodns`,`protobuf` for chromecast) (use `mpv` as a backup) TODO: Test chromecast once on real hardware - see archwiki
* Image viewer - `qview` (AUR)
* pdf viewer - `zathura`,`zathura-pdf-mupdf`,`zathura-cb`,`zathura-djvu`
* debugger - `seer` `gdbfrontend` `gdbgui` + try a non-graphical one like `cgdb` `gdbtui` or just `gdb` to learn about them
* IDE - `neovim` `vscode`
  * TODO: Give CLion, QtCreator a try
* browser - `firefox`
* office suite - `libreoffice`
* screenshot tool - `flameshot`
* hexeditor - `imhex`
* system/process monitor - `conky` `htop`
* virtual machines - `virtualbox`, `qemu` + `virtmanager`
* color picker - `kcolorchooser`
* screen recorder - `peek` for quick small gifs/vids, `obs-studio` for full recording
* music - `cmus` `deadbeef` (AUR) `spotify` (TODO: mpd + mpd in polybar? basically get music working with polybar)
* google drive - `drivesync` (AUR)
* disk usage display - `filelight`
* chat - `discord`
* developer tools - `binutils` `cmake`
* image editor - `gimp`
* System information viewer - `neofetch`
* text to ascii art - `figlet`
* disk partitioner - `cfdisk`
* diff tool - `meld` `vimdiff`
* git gui - `vscode` or `vim` - can't find an OSS good gui
* notes - `joplin`
* todo tool - `devtodo`
* Pomodoro timer? tomato?
* Touch typing software?
* volume control? like kmix?
* webcam software - cheese?
* keychain?/password manager?

### Can only do once on laptop

* Setup volume, brightness, bluetooth and wifi on polybar (maybe have notifications when these change)
* Setup bluetooth manageer (blueman)
* Proper power settings `cpupower` `powertop` (https://community.frame.work/t/linux-battery-life-tuning/6665/174?page=8)
* fprint for finger print?
* `bluez`,`bluez-utils` and [polybar](https://github.com/msaitz/polybar-bluetooth) for [bluetooth](https://wiki.archlinux.org/title/bluetooth)
* make multimonitor support work (might need to use `xrandr` to get it working - use rofi for menu - https://www.youtube.com/watch?v=wu2NWw2wPaA)

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
