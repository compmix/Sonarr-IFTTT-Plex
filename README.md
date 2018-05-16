# Sonarr-IFTTT-Plex
A simple script to send push notifications from Sonarr to your mobile device using IFTTT with Plex deep linking support.

# Usage

## 1. Setting up IFTTT


### 1a. Getting IFTTT Webhooks API Key


## 2. Getting Plex API info

https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/
https://forums.plex.tv/discussion/129922/how-to-request-a-x-plex-token-token-for-your-app/p1



### 2a. Get Plex API Key
Run the setup\Get-PlexInfo.ps1

### 2b. Get TV Show section key


## 3. Setting up Sonarr
host:port/settings/connect
Create a new Custom Connection
C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe
-ExecutionPolicy Bypass -File C:\sonarr\custom_scripts\ifttt-webhook-on-event.ps1

![enter image description here](https://i.imgur.com/3iyZuFm.png)

## References

https://forums.plex.tv/discussion/286545/deep-links
https://github.com/Sonarr/Sonarr/wiki/Custom-Post-Processing-Scripts
https://support.plex.tv/articles/201638786-plex-media-server-url-commands/
https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/
