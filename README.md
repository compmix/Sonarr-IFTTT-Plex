# Sonarr-IFTTT-Plex
A simple script to send push notifications from Sonarr to your mobile device using IFTTT with Plex deep linking support.


# Usage
When configured properly, your mobile device will receive rich notifications when an episode is grabbed, downloaded, or renamed. Plus, opening the notification will send you to the show page inside the Plex app.

# Setup
1. Set up IFTTT webhook event that sends rich notifications.
2. Download ifttt_webhook_on_event.ps1 and config.ini file. Fill config.ini with necessary IFTTT and Plex API info.
3. In Sonarr, add a Custom Post Processing Script with ifttt_webhook_on_event.ps1.

See [detailed setup instructions](setup/setup.md).


## References
https://forums.plex.tv/discussion/286545/deep-links
https://github.com/Sonarr/Sonarr/wiki/Custom-Post-Processing-Scripts
https://support.plex.tv/articles/201638786-plex-media-server-url-commands/
https://support.plex.tv/articles/204059436-findingaan-authentication-token-x-plex-token/
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM3MzQyNTk5LC0xMTUwODMwMTAwXX0=
-->