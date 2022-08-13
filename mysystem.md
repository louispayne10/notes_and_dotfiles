This contains a list of software that I like on my system.

I'd like at some point to have a script that takes a base arch linux install and installs all of these while copying over my dotfiles and configurations for all the software, that would be ideal :)

TODO: make sure locales work once installed!

### Core components:

* Display Server: `X11`
* Window manager: `i3wm`
  * TODO: Look into `i3-gaps`
  * TODO: exit? `i3exit`?
* Status bar: `i3bar`
  * TODO: look into `polybar` and `i3-status-rust`
* launcher: `dmenu` (or `rofi`?)
* Compositor: `xcompmgr`
* Desktop background: TODO: `nitrogen` or `feh`?
* Init System: `systemd`
  * Also use for ntp, logging and much more
* Nework Sofware: `NetworkManager`
* Terminal: `kitty`
* Shell: `bash`
  * TODO: make sure tab completion is working
  * TODO: cool bash prompt?
* Display manager: `lightdm`?
* File manager:
  * TODO: look into (`caja`, `thunar`, `nautilus`) (TUI file manager? ranger?)
* Bootloader: `grub`
* Audio: `pulseaudio` 
  * TODO: look into this (`pipewire`?)
* Screen locker:
  * TODO: `i3lock-color`? ([see this for info on stuff](https://www.reddit.com/r/i3wm/comments/9ebemt/locking_i3_when_lid_of_laptop_is_closed/e5npbhp/))

### Other (less) core bits of software:
* `git`
* `vim`
  * TODO: `neovim`?
* `sudo`

Unknowns:
calculator: kcalc?
polkit: lxqt-policykit?
Fonts/emoji support: (truetype?)? font viewer?
Media player: VLC or mpv?
Image viewer: viewnior?
pdf viewer: mupdf?
debugger: Seer? gdbfrontend?
IDE: vscode?
browser: firefox?
notifications?: dunst?
keychain?/password manager?:
auto-cpufreq for power? ([power management in general](https://wiki.archlinux.org/title/Power_management))
libreoffice?
discord/spotify
cmus?
screenshot tool? maim/scrot?
clipboard manager? clipmenu?
qemu/virtualbox?
gcc/binutils + other dev tools like curl/wget cmake kcachegrind valgrind
fprint for finger print?
google drive drivesync?
volume control? like kmix?
webcam software - cheese?
kompare diff tool?
hexeditor?
conky - system monitor?
filelight - disk usage display?
System information viewers - like neofetch?
bluetooth frontend?
dnote for notes? devtodo for todos?
Pomodoro timer? tomato?
Touch typing software?
figlet!

### Notes

* The compositor `xcompmgr` is very simple, more advanced ones that have more features like `picom` exist but this works for now
* [arch wiki on framework](https://wiki.archlinux.org/title/Framework_Laptop) 
