## miscellaneous
* super+q -> terminal
* super+c -> close active
* to update and install basic packages
```bash
sudo pacman -Syu 
check.sh # check for dependencies not installed
```
## yay installation
```bash
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si # builds with makepkg
```
## hyprland
change the following in hyprland.conf:
* aesthetics
    * blur
    * rounding
    * shadow
    * animation
* functionality
    * comment out the special workspace

    |funtion|key|
    |---|---|
    |togglesplit|S|
    |killactive|Q|
    |terminal|RETURN|
    |move focus up, left, right, down|k,h,l,j|
```conf
$fileManager = kitty python3 ~/ranger/ranger.py
exec-once = dunst & hyprpaper & waybar

input {
	kb_options = caps:escape
	}
general {
    border_size = 0
    }

bind = $mainMod,w,exec,firefox --private-window 
bind = control_l,b,exec,killall waybar || waybar
bind = control_l,w,exec, killall hyprpaper || hyprpaper
```
## terminal (kitty)
* change theme -> `kitty +kitten themes`	
* change font -> `kitten choose-fonts`
* add this to kitty.conf
```conf
window_padding_width 20
```
## file manager (ranger)
installation
```bash
git clone https://github.com/ranger/ranger/
cd ranger
python3 ./ranger.py
```
* press backspace to show hidden files in ranger
* to obtain config files cp ranger/config to .config/ranger
* add the following to rc.conf
```conf
set preview_images_method kitty
set preview_images true
set show_hidden true
map xc shell wl-copy < %f
map <F1> shell hyprctl hyprpaper reload ,%d/%f #pressing f1 will change the wallpaper
```
* make sure neovim opens as default text editor or change editor -> neovim in `rifle.py`
## neovim
just copy the `nvim` folder to the `.config` folder
## screenshot
* dunst for notification to check if it works use `dunstify "It works"`
* add the following lines to the `hyprland.conf`
* refer to this link for [source](https://github.com/equk/dotfiles)
* run `scrn.sh ?` to get help
```conf
bind = control_r,1, exec, ~/scrn.sh f   # screenshot of full screen/monitor
bind = control_r,2, exec, ~/scrn.sh a   # screenshot of active window
bind = control_r,3, exec, ~/scrn.sh s   # screenshot of a selected area
```
## github-cli
login to the gh account using browser
```bash
gh auth login
```
## final .bashrc
```bash
clear
export EDITOR="nvim"
alias sb="source .bashrc"
alias n="nvim"
alias lg="lazygit"
alias f="python3 ~/ranger/ranger.py"
alias sd="systemctl poweroff"

eval "$(starship init bash)"
```
## mount the server
```bash
mkdir ~/server
mount -t cifs # make sure command works
fuser # make sure command works
sudo mount -t cifs //ip-address/share_point ~/server -o username=<your_username>,password=<your_password>,uid=<client_username>

```
add this to /etc/fstab
```
//ipaddr/share_point	/home/vamsi/server	cifs	username=<your_username>,password=<your_password>,uid=<client_username>
```
## check dependencies and install the rest
run the script `check.sh`
## todo
- [x] add yay link
- [ ] add waybar configs link
- [ ] add vim keybinds in a table
