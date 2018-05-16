$cred = Get-Credential;
$user = $cred.UserName;
$pass = $cred.GetNetworkCredential().Password;
$url = "https://plex.tv/users/sign_in.xml";

$EncodedPassword = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$user`:$pass"));
$headers = @{};
$headers.Add("Authorization","Basic $($EncodedPassword)") | Out-Null;
$headers.Add("X-Plex-Client-Identifier","Sonarr-IFTTT") | Out-Null;
$headers.Add("X-Plex-Product","Sonarr IFTTT Notifications") | Out-Null;
$headers.Add("X-Plex-Version","V1") | Out-Null;
[xml]$res = Invoke-RestMethod -Headers:$headers -Method Post -Uri:$url;
$token = $res.user.authenticationtoken;

$url = Read-Host "Enter your plex server URL (format hostname:port)"

$machineID = (Invoke-RestMethod -URI "http://$url/?X-Plex-Token=$token").documentelement.machineidentifier;

$tvkey = (Invoke-RestMethod -URI "http://$url/library/sections?X-Plex-Token=$token");
$sections = ($tvkey.DocumentElement.Directory) | Select-Object -Property Title, key

Write-Host "`n`nSave this info in the config.ini file:";
Write-Host "PlexURL=http://$url";
Write-Host "PlexToken=$token";
Write-Host "PlexServerID=$machineid";
Write-Host "`nPlexTVShowSectionKey= pick one of the keys from below";
$sections | out-string;


pause

