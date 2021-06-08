# ubuntuTweak
`bluelul`

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
