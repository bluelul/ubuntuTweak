# What it does
- Install ngrok service on Linux
- Start ngrok with configuration in ngrok.yml file
- Config to autorun ngrok on startup 

# Original repo
https://github.com/vincenthsu/systemd-ngrok

# Editor
`bluelul.com`
- Automatic install missing packages with `apt install`
- Add `region ap` to `ngrok.yml`
- Use `svn` instead of `git` to download this folder

# Automatic installation
Execute `install.sh` on Linux x64 platform by running these codes below on terminal
```bash
curl -O https://raw.githubusercontent.com/bluelul/ubuntuTweak/main/ngrok/install.sh
chmod +x install.sh
sudo ./install.sh <your_authtoken>
```
After installation, run command below to verify whether ngrok service is up
```bash
systemctl status ngrok
```

# Manual installation (what install.sh really does)

Step 1: Place [`ngrok`](https://ngrok.com/download) in `/opt/ngrok/`.

Step 2: Get `authtoken` from ngrok website, then add it to `/opt/ngrok/ngrok.yml`.

Step 3. Modify your own configrations in `/opt/ngrok/ngrok.yml`.

Step 4: Add `ngrok.service` to `/lib/systemd/system/`.

Step 5: Start ngrok service by typing:

```
systemctl enable ngrok.service
systemctl start ngrok.service
```
