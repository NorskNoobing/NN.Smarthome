function Get-FfailAccessToken {
    param (
        [string]$accessTokenPath = "$env:USERPROFILE\.creds\Ffail\ffailAccessToken.xml"
    )

    if (!(Test-Path $accessTokenPath)) {
        New-FfailAccessToken
    }

    Import-Clixml $accessTokenPath | ConvertFrom-SecureString -AsPlainText
}