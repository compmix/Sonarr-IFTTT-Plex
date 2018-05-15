# Set values from config.ini
$Config = ConvertFrom-StringData (Get-Content -Path ".\config.ini" -Raw)
$IFTTTEventName = $Config.IFTTTEventName;
$IFTTTWebhookKey = $Config.IFTTTWebhookKey;
$PlexURI = $Config.PlexURI;
$PlexToken = $Config.PlexToken;
$PlexServerID = $Config.PlexServerID;
$PlexTVShowKey = $Config.PlexTVShowKey;
$Title = $Config.DefaultTitle;
$Message = $Config.DefaultMessage;
$LinkURL = $Config.LinkURL;

# Notification Contents
# Value1 => $Title
# Value2 => $Message 
# Value3 => $LinkURL "plex://preplay/?metadataKey=$ShowMetadataKey&metadataType=2&server=$PlexServerID"


# Grab and set Plex $LinkURL to the show
$LibrarySectionXML = Invoke-RestMethod -URI "$PlexURI/library/sections/$PlexTVShowKey/all?X-Plex-Token=$PlexToken";
$ShowMetadataKey = ($LibrarySectionXML.DocumentElement.Directory | Where-Object title -eq "$env:sonarr_series_title").key;
if (!$ShowMetadataKey) {
    # Couldn't find MetadataKey, keep default LinkURL

} elseif ( $ShowMetadataKey.EndsWith("children") ) { 
    # Remove trailing "/children" from the key
    $ShowMetadataKey = $ShowMetadataKey.remove($ShowMetadataKey.LastIndexOf("/"), 9);
    $LinkURL = "plex://preplay/?metadataKey=$ShowMetadataKey&metadataType=2&server=$PlexServerID";
}


# Change $Title and $Message
if ($env:sonarr_eventtype -eq "Download") {
    $Title = "Sonarr - Episode Downloaded";
    $Message = "$env:sonarr_series_title S$env:sonarr_episodefile_seasonnumber E$env:sonarr_episodefile_episodenumbers has been downloaded! Tap to open Plex.";

} elseif ($env:sonarr_eventtype -eq "Rename") {
    $Title = "Sonarr - Episode Renamed";
    $Message = "$env:sonarr_series_title episode files have been renamed. Tap to open Plex.";
    
} elseif ($env:sonarr_eventtype -eq "Grab") {
    $Title = "Sonarr - Episode Downloading";
    $Message = "$env:sonarr_series_title S$env:sonarr_release_seasonnumber E$env:sonarr_release_episodenumbers ($env:sonarr_release_quality),  $([math]::round( $env:sonarr_release_size / 1MB, 3) ) has started downloading from $env:sonarr_release_indexer.";

}


$JSONBody = "{ ""value1"" : ""$Title"", ""value2"" : ""$Message"", ""value3"" : ""$LinkURL"" }";
Invoke-WebRequest -URI "https://maker.ifttt.com/trigger/$IFTTTEventName/with/key/$IFTTTWebhookKey" -Method POST -ContentType "application/json" -Body $JSONBody