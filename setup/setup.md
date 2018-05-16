
# Setup
A simple script to send push notifications from Sonarr to your mobile device using IFTTT with Plex deep linking support.

# Tutorial

## 1. Setting up IFTTT
### 1a. Create an IFTTT applet
Service: **Webhooks**
Trigger: **Receive a web request**
Event Name: `sonarr_on_event`
Action Service: **Notifications**
Action: **Send a rich notification from the IFTTT app**

Title: `{{value1}}`
Message: `{{value2}}`
Link URL: `{{value3}}`
Image URL: `https://i.imgur.com/hlfVtI3.png`

In the end, the configuration should look like this: https://i.imgur.com/3lVAhm8.png

### 1b.  IFTTT Webhooks API Key
Get your key from here:
https://ifttt.com/services/maker_webhooks/settings

The last part of the URL contains your key. Put it in the config.ini file.
![https://i.imgur.com/2p0kjn0.png](https://i.imgur.com/2p0kjn0.png)

## 2. Getting Plex Info


### 2a. The easy way (script)


Run the Get-PlexInfo.ps1 PowerShell script. It should give you this information:
```
PlexToken=
PlexServerID=
PlexTVShowKey=
```
### 2b. Manually
Obtain an app token. See [this forum thread](https://forums.plex.tv/discussion/129922/how-to-request-a-x-plex-token-token-for-your-app/p1) for more info.
Invoke-RestMethod -URI "http://plexserver.url:port/library/sections?X-Plex-Token=$PlexToken";
response = Invoke-RestMethod -URI "http://plexserver.url:port/library/sections/7/all?X-Plex-Token=$PlexToken";
response = Invoke-RestMethod -URI "http://plexserver.url:port/library/metadata/11115?X-Plex-Token=$PlexToken";

### 2b. Get TV Show section key


## 3. Setting up Sonarr
host:port/settings/connect
Create a new Custom Connection
C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe
-ExecutionPolicy Bypass -File C:\sonarr\custom_scripts\ifttt-webhook-on-event.ps1

![enter image description here](https://i.imgur.com/3iyZuFm.png)


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTA5OTYyMTU5NiwtODA4NTI3MzQwLDIyMT
g2NDU2MywtMTc0NzA4MDk0MSwtMzY1Mzc4NDc0LC0xODU5ODc4
Nzc5LC0xMTM2OTU4MDgxXX0=
-->