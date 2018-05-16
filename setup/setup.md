
# Setup
A simple script to send push notifications from Sonarr to your mobile device using IFTTT with Plex deep linking support.

# Tutorial

## 1. Setting up IFTTT
### 1a. Create an IFTTT applet
Service: Webhooks
Receive a web request
Event: sonarr_on_event
Action Service: Notifications
"Send a rich notification from the IFTTT app"

### 1b.  IFTTT Webhooks API Key
Create a new Webhooks
https://i.imgur.com/3lVAhm8.png

Get your key from here:
https://ifttt.com/services/maker_webhooks/settings
https://maker.ifttt.com/use/{key}
## 2. Getting Plex API info

https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/
https://forums.plex.tv/discussion/129922/how-to-request-a-x-plex-token-token-for-your-app/p1



### 2a. Get Plex API Key
Invoke-RestMethod -URI "http://192.168.2.201:32400/library/sections?X-Plex-Token=$PlexToken";
response = Invoke-RestMethod -URI "http://plex.compmix.xyz/library/sections/7/all?X-Plex-Token=$PlexToken";
response = Invoke-RestMethod -URI "http://192.168.2.201:32400/library/metadata/11115?X-Plex-Token=$PlexToken";

### 2b. Get TV Show section key


## 3. Setting up Sonarr
host:port/settings/connect
Create a new Custom Connection
C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe
-ExecutionPolicy Bypass -File C:\sonarr\custom_scripts\ifttt-webhook-on-event.ps1

![enter image description here](https://i.imgur.com/3iyZuFm.png)


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTIwMTg1NjEsLTM2NTM3ODQ3NCwtMTg1OT
g3ODc3OSwtMTEzNjk1ODA4MV19
-->