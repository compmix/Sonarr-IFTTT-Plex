# IFTTT Webhook API
$IFTTTEventName = "";
$IFTTTWebhookKey = "";

# Plex API
$PlexURI = "";
$PlexToken = "";
$PlexServerID = "";
$PlexTVShowKey = "";

# Default Notification Contents
# Value1 => $Title
# Value2 => $Message 
# Value3 => $LinkURL "plex://preplay/?metadataKey=$ShowMetadataKey&metadataType=2&server=$PlexServerID"
$Title = "Default Sonarr Event";
$Message = "Default Sonarr Event Notification Test";
$LinkURL = "plex://";

# Grab Plex link to the show
$LibrarySectionXML = Invoke-RestMethod -URI "$PlexURI/library/sections/$PlexTVShowKey/all?X-Plex-Token=$PlexToken";
$ShowMetadataKey = ($LibrarySectionXML.DocumentElement.Directory | Where-Object title -eq "$env:sonarr_series_title").key;

# Remove trailing "/children" from key
if (!$ShowMetadataKey) {
    write-host "metadata empty";
} elseif ( $ShowMetadataKey.EndsWith("children") ) { 
    $ShowMetadataKey = $ShowMetadataKey.remove($ShowMetadataKey.LastIndexOf("/"), 9);
}


if ($env:sonarr_eventtype -eq "Download") {
    $Title = "Sonarr - Episode Downloaded";
    $Message = "$env:sonarr_series_title S$env:sonarr_episodefile_seasonnumber E$env:sonarr_episodefile_episodenumbers has been downloaded! Tap to open Plex.";
    $LinkURL = "plex://preplay/?metadataKey=$ShowMetadataKey&metadataType=2&server=$PlexServerID";

} elseif ($env:sonarr_eventtype -eq "Rename") {
    $Title = "Sonarr - Episode Renamed";
    $Message = "$env:sonarr_series_title episode files have been renamed. Tap to open Plex.";
    $LinkURL = "plex://preplay/?metadataKey=$ShowMetadataKey&metadataType=2&server=$PlexServerID";

} elseif ($env:sonarr_eventtype -eq "Grab") {
    $Title = "Sonarr - Episode Downloading";
    $Message = "$env:sonarr_series_title S$env:sonarr_release_seasonnumber E$env:sonarr_release_episodenumbers ($env:sonarr_release_quality),  $([math]::round( $env:sonarr_release_size / 1MB, 3) ) has started downloading from $env:sonarr_release_indexer.";

}


$JSONBody = "{ ""value1"" : ""$Title"", ""value2"" : ""$Message"", ""value3"" : ""$LinkURL"" }";
Invoke-WebRequest -URI "https://maker.ifttt.com/trigger/$IFTTTEventName/with/key/$IFTTTKey" -Method POST -ContentType "application/json" -Body $JSONBody