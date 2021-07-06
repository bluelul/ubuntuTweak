# Ubuntu Tweak
Tweaks that every Ubuntu/Linux user needs  
Better experience of using Ubuntu  

### Author: `bluelul.com`
  
## Increase Wubi Disk
Run command directly on Wubi Linux OS
```bash
sudo dd if=/dev/zero bs=1MiB of=/host/ubuntu/disks/root.disk conv=notrunc oflag=append count=2048
sudo losetup -c /dev/loop0
sudo resize2fs /dev/loop0
```
## Notify after long command finished in terminal
- install undistract-me
```bash
sudo apt-get install undistract-me
```
- open ~/.bashrc file by gedit with sudo
```bash
sudo gedit ~/.bashrc
```
- add these lines to ~/.bashrc file
```bash
if ! [ -z "$BASH_VERSION" -o -z "$PS1" -o -n "$last_command_started_cache" ]; then
  . /usr/share/undistract-me/long-running.bash
  notify_when_long_running_commands_finish_install
fi
```
- close all terminals
- open a terminal and test by running this command then switching to another window
```bash
sleep 11
```

## Disable Linux time affecting Window time
```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```

## Disable Tab auto-completion case-sensitive in Bash
```bash
echo set completion-ignore-case on | sudo tee -a /etc/inputrc
```
Close all terminals and reopen

## Detailed list file command
```bash
echo alias lah=\'ls -lah\' >> ~/.bashrc
```
Open new terminal and type `lah`

## Multiscreen terminal
```bash
sudo apt install terminator
```

## Install Nvidia Driver
```bash
sudo ubuntu-drivers autoinstall
```
Check driver has installed successfully by command `nvidia-smi`

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

<br/>

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
