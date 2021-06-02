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
```bash
sudo apt-get install undistract-me
```
- close all terminals
- restart ubuntu
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
