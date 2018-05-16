
# Setup
A simple script to send push notifications from Sonarr to your mobile device using IFTTT with Plex deep linking support.

# Tutorial

## 1. Setting up IFTTT
### 1a. Create an IFTTT applet
- Service: **Webhooks**
- Trigger: **Receive a web request**
- Event Name: `sonarr_on_event`
- Action Service: **Notifications**
- Action: **Send a rich notification from the IFTTT app**

- Title: `{{value1}}`
- Message: `{{value2}}`
- Link URL: `{{value3}}`
- Image URL: `https://i.imgur.com/hlfVtI3.png`

In the end, the configuration should look like this: https://i.imgur.com/3lVAhm8.png

### 1b.  IFTTT Webhooks API Key
Get your key from here:
https://ifttt.com/services/maker_webhooks/settings

The last part of the URL contains your key. Put it in the config.ini file.
![https://i.imgur.com/2p0kjn0.png](https://i.imgur.com/2p0kjn0.png)

## 2. Getting Plex Info


### 2a. The easy way (script)

Run the Get-PlexInfo.ps1 PowerShell script and follow instructions. It should give you this information:
```
PlexToken=
PlexServerID=
PlexTVShowKey=
```
Fill out the config.ini file.

### 2b. Manually
1. Obtain an app token. See [this forum thread](https://forums.plex.tv/discussion/129922/how-to-request-a-x-plex-token-token-for-your-app/p1) for more info.
2. Obtain your Plex Server ID (machineid)
`Invoke-RestMethod -URI "http://plexserver.url:port/?X-Plex-Token=$PlexToken"`
3. Obtain the TV Shows Section Key
`Invoke-RestMethod -URI "http://plexserver.url:port/library/sections?X-Plex-Token=$PlexToken"`

Fill out the config.ini file.

## 3. Setting up Sonarr
1. Navigate to Sonarr>Settings>Connect
2. Create a new Custom Script Connection
Path: `C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe`
Arguments: `-ExecutionPolicy Bypass -File C:\path\to\script\ifttt-webhook-on-event.ps1`

It should look like this:
![enter image description here](https://i.imgur.com/3iyZuFm.png)


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU2OTc3MjkyOSw1MjY2NDIyMjYsMTAyOT
k5OTIzMSwtMTY4NjA4MTc1NSwtODA4NTI3MzQwLDIyMTg2NDU2
MywtMTc0NzA4MDk0MSwtMzY1Mzc4NDc0LC0xODU5ODc4Nzc5LC
0xMTM2OTU4MDgxXX0=
-->