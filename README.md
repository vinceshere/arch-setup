# Arch setup with BSPWM

This script aims to setup my environment. If you want to use it, changes should be made to fit your hardware. 

![plot](screenshot.png?raw=true)

## Short list of tools:
- BSPWM (window manager)
- Polybar (fixed top bar)
- Pipewire (audio server)
- A lot of Xorg junk (but recommended to have)
- Kitty (terminal emulator)
- Thunar (file manager)

For the full list of dependencies installed, follow the next section.

## Packages

Remove the software that you don't want bellow (be careful to don't remove needed dependencies):

- [Official Repositories](./pacman-packages-list.txt)
- [AUR](./yay-packages-list.txt)

## Usage

After clone this to your home directory in a fresh Arch install, run the following:

```
$ chmod +x setup.sh
$ ./setup.sh
```

Your root password will be requested.

## Key bindings
- Super + Enter: opens terminal;
- Super + Space: opens rofi;
- Ctrl + Alt + Del: opens power menu;
- Print: Full desktop printscreen that will be saved in ~/Pictures/Screenshots;
- Shift + Print: prints from selected area and saves at the same folder;
- Ctrl + Shift + Print: prints selected area to clipboard;
- All the defaults from BSPWM and sxhkd;

