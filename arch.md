# Arch Linux

These are just my notes so that I don't forget the things that I have done as that drives me insane :>)

## Installing

Generally [the arch wiki](https://wiki.archlinux.org/title/installation_guide) is a good resource for installing arch

### On a VM

1) Click _new_ to create a new vm
2) Expert mode
3) Give it a name, some RAM + create a virtual harddisk now
4) vdi harddisk + dynamically allocated, give it a size
5) Click _settings_ for the VM
6) System -> Enable EFI -> Processor -> Give it some CPU
7) Display -> Give it video memory (128m) + enable 3d acceleration
8) Storage -> Add optical -> Add arch ISO 

The VM can be launched now as if it was from a live ISO (the optical disk). (Note for laptop preferences -> display -> scaling can be useful). See below how to setup it up from here - same as boot medium.

### From boot medium (No script)

1) Set keyboard layout
   * Viewed with `ls /usr/share/kbd/keymaps/**/*.map.gz`
   * Set to `uk` layout with `loadkeys uk`
2) Verify network connectivity
   * `ip link` to see interfaces and `ping google.com` to check it's working
3) Time & date
   * `timedatectl set-ntp true`
   * Verify working `timedatectl status`
4) Partition the disk (**Note**: Make sure to setup the correct partition table (BIOS = DOS, EFI=GPT))
   * Use `fdisk` or `cfdisk` (is nicer)
   * Create the correct partition table
   * Create a partition for the EFI partition (550M) should be type EFI (Do not do this if one already exists!)
   * Create a swap partition should be type linux swap
   * Create a partition for our main filesystem of type Linux filesystem
5) Make the filesystems (The order of `sdaX` will depend on what order the partitions were made in)
   * `mkfs.fat -F32 /dev/sda1` for EFI partition if just created
   * `mkswap /dev/sda2` for swap partition and turn it on `swapon /dev/sda2`
   * `mkfs.ext4 /dev/sda3` for ext4 partition and then mount it with `mount /dev/sda3 /mnt`
6) Install system to disk
   * `pacstrap /mnt base linux linux-firm` will install the base arch system, linux kernel and firmware
7) Generate fstab
   * `genfstab -U /mnt >> /mnt/etc/fstab`
8) Change root into new fs
   * `arch-chroot /mnt`
9) Setup timezone
    * `ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime`
10) Setup hardware clock
    * `hwclock --systohc`
11) Setup locale
    * Install vim `pacman -S vim`
    * `vim /etc/locale.gen` and uncomment `en_GB.UTF8`
    * run `locale-gen`
12) Set hostname
    * `vim /etc/hostname` and pass in a name for the machine
13) Edit hosts file
    * `vim /etc/hosts` and add
    * `127.0.0.1        localhost`
    * `::1              localhost`
    * `127.0.1.1        hostname.localdomain    hostname`
14) Setup users and sudo
    * `passwd` setup a password for root user
    * `useradd -m louis` create louis user
    * `passwd louis` set louis password
    * `usermod -aG wheel,audio,video,optical,storage louis` add user to groups including wheel group for sudo
    * `pacman -S sudo`
    * `visudo` and uncomment wheel=ALL line
15) Install grub and configure if needed
    * `pacman -S grub`
    * `pacman -S efibootmgr dosfstools os-prober mtools`
    * `mkdir /boot/EFI`
    * `mount /dev/sda1 /boot/EFI`
    * `grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck`
    * `grub-mkconfig -o /boot/grub/grub.cfg`
16) Good to install NetworkManager before rebooting
    * `pacman -S networkmanager`
    * `systemctl enable NetworkManager`
17) Reboot
    * `exit`
    * `umount -R /mnt`
    * `shutdown 0` (do this in VM and remove ISO) or `reboot`
