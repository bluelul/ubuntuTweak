# ubuntuTweak
`bluelul`

## Notify after long command finished in terminal
```
sudo apt-get install undistract-me
```
- close all terminals
- open a terminal and test by running this command and switch to another window
```
sleep 11
```

## Disable Linux time affects Window time
```
timedatectl set-local-rtc 1 --adjust-system-clock
```

## Disable Tab auto-completion case-sensitive in Bash
```
echo set completion-ignore-case on | sudo tee -a /etc/inputrc
```
