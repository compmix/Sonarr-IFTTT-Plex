# Sonarr-IFTTT-Plex
A simple script to send push notifications from Sonarr to your mobile device using IFTTT with Plex deep linking support.


# Usage
When configured properly, your mobile device will receive rich notifications when an episode is grabbed, downloaded, or renamed. Plus, opening the notification will send you to the show page inside the Plex app.

# Setup
Download IFTTT on mobile device.
Create an IFTTT webhook event that sends rich notifications.
Configure Sonarr, add a Custom Post Processing script with ifttt_webhook_on_event.ps1
Fill in config.ini file with necessary info.

See [detailed setup instructions](setup/setup.md).


# References
https://forums.plex.tv/discussion/286545/deep-links
https://github.com/Sonarr/Sonarr/wiki/Custom-Post-Processing-Scripts
https://support.plex.tv/articles/201638786-plex-media-server-url-commands/
https://support.plex.tv/articles/204059436-findingaan-authentication-token-x-plex-token/