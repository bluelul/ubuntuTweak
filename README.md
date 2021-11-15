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

## Multiscreen terminal
```bash
sudo apt install terminator
```

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
