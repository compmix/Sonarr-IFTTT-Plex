
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

https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/
https://forums.plex.tv/discussion/129922/how-to-request-a-x-plex-token-token-for-your-app/p1



### 2a. Get Plex API Key
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
eyJoaXN0b3J5IjpbNTU3NTY0MzY2LC04MDg1MjczNDAsMjIxOD
Y0NTYzLC0xNzQ3MDgwOTQxLC0zNjUzNzg0NzQsLTE4NTk4Nzg3
NzksLTExMzY5NTgwODFdfQ==
-->