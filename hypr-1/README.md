# my *Hyprland* setup

<img src="https://github.com/gvr-04/hyprland-1/blob/master/github-pictures/2024-10-29_19-10-1730209787.png">

### Important Packages and Utilities

* `hyprpaper` ✰ Blazing fast wallpaper utility for *Hyprland*
* `waybar` ✰  Highly customizable Wayland bar
* `ranger` ✰  Console file manager with VI key bindings. 
* `neovim` ✰  Text-editor
* `bluez` and `bluez-utils` ✰  Canonical implementation of the Bluetooth protocol 
* `brightnessctl` ✰  Lightweight brightness control tool 
* `playerctl` ✰  Mpris media player controller and lib
* `pavucontrol` ✰  PulseAudio Volume Control
* `udisks2` ✰  to mount and unmount disks
* `less` ✰  Pager 
* `wl-clipboard` ✰  Wayland copy and paste command line utilities
* `stow` ✰  Create symlinks for the config files

Copy and paste to install:
```
sudo pacman -Syu hyprpaper waybar ranger neovim bluez bluez-utils brightnessctl playerctl pavucontrol udisks2 wl-clipboard less stow
```

Fonts needed:
```
sudo pacman -S ttf-nerd-fonts-symbols ttf-inconsolata noto-fonts-cjk
```
### Clone and Stow

```
git cone https://github.com/gvr-04/Dotfiles.git
cd ~/Dotfiles
stow --adopt hyprland
git reset --hard
```

### Neovim Plugins

Install `vim-plug` as plugin manager from *__[here](https://github.com/junegunn/vim-plug)__*.\
To install plugins in neovim run
```
:PlugInstall
``` 

### Ranger config

Copy default config of ranger:
```
ranger --copy-config=all
```

Install `ranger_udisk_menu` to mount disks from ranger from *__[here](https://github.com/SL-RU/ranger_udisk_menu)__*.\
Add the following lines in `.config/rc.conf`
```
set show_hidden true
set preview_images true
set preview_images_method kitty 
map xc shell wl-copy < %f
```


### Optional utilities

* `lazygit` ✰  for terminal UI for git (*optional*)
```
sudo pacman -S lazygit
```
* `yay` ✰  arch user repository helper
```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si # builds with makepkg
```
* `cava` ✰  audio visualizer
```
yay -S cava
```
