# Ubuntu Tweak
Tweaks that every Ubuntu/Linux user needs  
Better experience of using Ubuntu  

### Author: `bluelul.com`
  
<br>

## Increase Wubi Disk
Run command directly on Wubi Linux OS
```bash
sudo dd if=/dev/zero bs=1MiB of=/host/ubuntu/disks/root.disk conv=notrunc oflag=append count=2048
sudo losetup -c /dev/loop0
sudo resize2fs /dev/loop0
```
Restart computer to fully update

<br>

## Disable Linux time affecting Window time
```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```

<br>

## Hot apply bashrc setting without opening new terminal <span id="hotbashrc"><span>
```bash
. ~/.bashrc
```

<br>

## Disable Tab auto-completion case-sensitive in Bash
```bash
echo set completion-ignore-case on | sudo tee -a /etc/inputrc
```
Close all terminals and reopen, or just [Hot apply bashrc](#hotbashrc)

<br>

## Detailed list file command
```bash
echo alias lah=\'ls -lah\' >> ~/.bashrc
```
Open new terminal and type `lah`, or just [Hot apply bashrc](#hotbashrc)

<br>

## Colorize headline of Root User Bash Prompt Terminal  
Run one of these theme template setting command in terminal  
- Ubuntu default theme (for normal user) 
  <p align="left"><img src="/asset/userTheme.jpg"/></p>

  ```bash
  echo "PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\\$ '" >> ~/.bashrc
  ```
- Root theme (for root user)
  <p align="left"><img src="/asset/rootTheme.jpg"/></p>

  ```bash
  sudo su
  echo "PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\\$ '" >> /root/.bashrc
  ```
- Docker theme (normally as root user)
  <p align="left"><img src="/asset/dockerTheme.jpg"/></p>

  ```bash
  echo "PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;44m\] \u@\h \[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\\$ '" >> /root/.bashrc
  ```
- Conda theme
  <p align="left"><img src="/asset/condaTheme.jpg"/></p>

  ```bash
  conda config --set env_prompt "\\[\\033[01;42m\\] {default_env} \\[\\033[0m\\]"
  conda config --set auto_activate_base false
  ```
Then open new terminal to apply changes, or just [Hot apply bashrc](#hotbashrc)

<details>
  <summary> Customize theme </summary>
  
  - Parts of a theme:  
    PS1='`${debian_chroot:+($debian_chroot)}` `\[\033[01;44m\]` ` \u@\h ` `\[\033[00m\]` `:` `\[\033[01;34m\]` `\w` `\[\033[00m\]` `\$ `'  
  - One color code affects the next text code
  - Special text code:
  ```
    \u : user
    \h : host
    \w : short path
    \W : full path
    \T : time in hh:mm:ss
    \@ : time in hh:mm AM/PM
    \n : new line
    \j : jobs
  ```
  - Color code: in format `\[\033[` `decoration_part` `type_part` `color_part` `m\]`
    - Decoration_part: optional, remember the `;` tail
    ```
    Normal : 00; or 06; or leave blank
    Bold : 01;
    Darker : 02;
    Italic : 03;
    Underline : 04;
    Blink : 05;
    Colored bachground with invisible text : 06;
    Invisible : 08;
    Strikethrough : 09;
    ```
    - Type_part: compulsory
    ```
    Reset : 0
    Color in text : 3
    Color in background with white text : 4
    High intensity (brighter) color in text : 9
    High intensity (brighter) color in background with white text : 10
    ```
    - Color_part: compulsory
    ```
    Black : 0
    Red : 1
    Green : 2
    Yellow : 3
    Blue : 4
    Purple : 5
    Cyan : 6
    White : 7
    ```
</details>

<br>

## Install Nvidia Driver
```bash
sudo ubuntu-drivers autoinstall
```
Check driver has installed successfully by command `nvidia-smi`

<br>

## Notify after long command finished in terminal
- install undistract-me and config in bashrc
```bash
sudo apt-get install undistract-me &&
sudo tee -a ~/.bashrc > /dev/null <<EOT
# Notify after long command (execute over 10 seconds) finished
if ! [ -z "\$BASH_VERSION" -o -z "\$PS1" -o -n "\$last_command_started_cache" ]; then
  . /usr/share/undistract-me/long-running.bash
  notify_when_long_running_commands_finish_install
fi
EOT
```
- close all terminals
- open a terminal and test by running this command then switching to another window
```bash
sleep 11
```

<br>

## Multiscreen terminal
### Install
```bash
sudo apt install terminator
```
### Deepblue color profile for terminator
- Run this command first:
```bash
cat >> ~/.config/terminator/config
```
- Paste all this text (with exactly spaces) to the waiting new line in terminator
```
  [[Deepblue]]
    background_color = "#002b36"
    background_darkness = 0.96
    background_type = transparent
    cursor_color = "#aaaaaa"
    foreground_color = "#b2c7cb"
    palette = "#2e3436:#cc0000:#719704:#c4a000:#347da4:#75507b:#06889a:#d3d7cf:#555753:#ef2929:#a6ca3c:#fce94f:#72abcf:#ad7fa8:#34b5e2:#eeeeec"
    scrollback_infinite = True
  
```
- Press Ctrl-C to finish
- Right-click on terminator -> Preferences -> Layouts -> set the Profile of `default`'s terminal `child1` to `Deepblue`

<br>

## "Open with ..." right click menu on Nautilus
<p align="center"><img src="/asset/openwithmenupreview.jpg"/></p>
  
### Install
- Ubuntu 19.04 and newer
  ```bash
  sudo apt install filemanager-actions nautilus-actions
  ```
### Config
- Run fma-config-tool
  ```bash
  fma-config-tool &
  ```
- Make actions to appear in the top level of the context menu: 
  - Go to `FileManager-Actions Configuration Tool` > `Preferences` > `Runtime Preferences` 
  - Uncheck the `Create a root FileManager-Actions` menu
  - Optional: select `Items ordering` as `Manual order`
  - Press `OK`
- Add menu items:
  - Method 1: 
    - Download all files in [this folder](https://github.com/bluelul/ubuntuTweak/blob/main/openwithmenu)
    - In `fma-config-tool`, go to `Tools` > `Import assistant`, follow GUI instructions to import downloaded config files
  - Method 2:
    - Manually create new menu item as below: 
  
| Action > Context label &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Action > Display item in selection.../location... | Command > Path | Command > Parameters &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
| ---------------------- | ------------------------------------------------- | -------------- | -------------------- |
| Open with _Terminator | no / yes | /usr/bin/terminator | --working-directory=%d/%b |
| Open with _Sublime Text | yes / yes | /usr/bin/subl | %d/%b |
| Open with Sublime _Merge | no / yes | /snap/bin/smerge | %d/%b |
| Open with VS _Code | yes / yes | /snap/bin/code | %d/%b |
### Apply
- Restart nautilus:
  ```bash
  nautilus -q
  nautilus &
  ```
- Done!
### Uninstall
```bash
sudo apt purge filemanager-actions*
```

<br>

## Disk Usage Analyzer CLI
```bash
sudo apt install ncdu
```

<br>

## Save session terminal
- Install tmux
```bash
sudo apt install tmux
```
- Config tmux
```bash
sudo tee -a ~/.tmux.conf > /dev/null <<EOT
# Make mouse useful in copy mode
setw -g mode-mouse on

# Allow mouse to select which pane to use
set -g mouse-select-pane on

# Scroll History
set -g history-limit 30000

# Set ability to capture on start and restore on exit window data when running an application
setw -g alternate-screen on

# Lower escape timing from 500ms to 50ms for quicker response to scroll-buffer access.
set -s escape-time 50
EOT 
```  

<br>

## Enable SSH connection
```bash
sudo apt install openssh-server
sudo ufw allow ssh
```
Check ssh service is up
```bash
systemctl status ssh
```
  
<br>
  
## Scan opened SSH ports in network
```bash
sudo nmap -sS -p 22 192.168.10.0/24
```
Remember to change `192.168.10.0/24` into local address space on your network, e.g. 192.168.1.0/24

<br>

## Install ngrok with run as startup
```bash
curl -O https://raw.githubusercontent.com/bluelul/ubuntuTweak/main/ngrok/install.sh
chmod +x install.sh
sudo ./install.sh <your_authtoken>
```
Check ngrok service is up
```bash
systemctl status ngrok
```

<br>  

## Show all saved wifi passwords  
```bash
(cd /etc/NetworkManager/system-connections && sudo grep "psk=" *)
```
  
<br>  
  
## System Monitor live on Top Bar
<p align="center"><img src="/asset/SysMonBar.jpg"/></p>
  
*Fully install graphic driver first*

### Install system monitor with graph 
Only for GNOME (Ubuntu 18.04+), may lag in Unity (Ubuntu 16.04)
- Run this command
```bash
sudo apt install gnome-tweaks gnome-shell-extension-system-monitor
```
- Log out and log in
- Open `GNOME Tweak Tool` --> `Extension` --> Turn on `System-monitor`

### Install system monitor with number
- Run this command
```bash
sudo apt install indicator-multiload
```
- Run `System Load Indicator` --> Click the section appear in top bar --> Choose `Preferences` --> `Indicator Items...` 
- **Option 1:** Paste the below text to the first item in list if you want to use along with `System-monitor` extension
```
Mem $(size(mem.user))  Net $(speed(net.down)) | $(speed(net.up))
```
- **Option 2:** Paste the below text to the first item in list if you only want to show number, not graph from `System-monitor` extension
```
Net $(speed(net.down)) | $(speed(net.up))   CPU $(percent(cpu.inuse))   Mem $(size(mem.user))
```
