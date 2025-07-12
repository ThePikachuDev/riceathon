# ThePikachuDev's Rice 

- this rice is a submission for [riceathon](https://riceathon.hackclub.com/)

## Screenshots 

![lightScreen_fastfetch](./previews/lightScreen_fastfetch.png)
![darkScreen_fastfetch](./previews/darkScreen_fastfetch.png)
![kew_nvim](./previews/kew_nvim.png)
![lock_screen](./previews/lock_screen.webp)
![myOwn_Power_widget](./previews/myOwn_Power_widget.png)

# Tools/Softwares I use :

- Distro : Fedora Linux
- Window Manager: Hyprland
- Code Editor : neovim ( btw )
- Terminal : Kitty
- Music Player : kew cli 
- Status Bar : waybar
- System Fetch : fastfetch 

[###](###) about power widget and lock screen 

i have used [Quickshell](https://quickshell.outfoxxed.me/) and [QML](https://doc.qt.io/) to create these widgets. which is also the part of my big project that i am currently making.
if you want to use these widgets you will have to install [Quickshell](https://quickshell.outfoxxed.me/docs/guide/install-setup/) and run them using this following command :


```
quickshell -p /path/to/widgetDirectory 
```

## Using My Config : 
you can just copy and paste most of the files to their respective location ( like moving waybar/ folder to .config/waybar folder and almost same of every other config folder ) and they'll work out of box if you have installed their respective packages.

for setting up zsh prompt , first install zsh for you distro : 
For fedora : 
```
sudo dnf install zsh
```

For Arch linux ( btw ) : 
```
sudo pacman -S zsh
```
or
```
yay -S zsh
```

After installing zsh , i have create a script to install the plugins i use : 
```
cp .zshrc ~/.zshrc
```
```
chmod +x ./zsh-setup.sh
```

This will install oh my zsh and 2 amazing plugins i use with zsh : 
```
./zsh-setup.sh
```


### Some Honorable mentions :

- Tmux : A terminal Multiplexer
- Browsers: firefox , zen and brave 
- Waypaper : A Gui Wallpaper Switcher







