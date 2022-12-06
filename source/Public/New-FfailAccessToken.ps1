function New-FfailAccessToken {
    param (
        [string]$accessTokenPath = "$env:USERPROFILE\.creds\FFail\ffailAccessToken.xml"
    )

    Write-Information -MessageData "Please send an email to `"power@ffail.win`" to get a free API key." -InformationAction "Continue"
    $apiKey = Read-Host "Enter Ffail API key" -AsSecureString

    #Create parent folders of the access token file
    $accessTokenDir = $accessTokenPath.Substring(0, $accessTokenPath.lastIndexOf('\'))
    if (!(Test-Path $accessTokenDir)) {
        $null = New-Item -ItemType Directory $accessTokenDir
    }

    #Create access token file
    $apiKey | Export-Clixml $accessTokenPath
}