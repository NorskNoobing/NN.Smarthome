function Get-EnergyPrice {
    param (
        [Parameter(Mandatory)][string]$Zone,
        [Parameter(Mandatory)][datetime]$Date,
        [switch]$test
    )
    if ($test) {
        $uri = "https://playground-norway-power.ffail.win/"
        $key = "123"
    } else {
        $uri = "https://norway-power.ffail.win/"
        $key = Get-FfailAccessToken
    }

    $convertedDate = Get-Date $Date -Format "yyyy-MM-dd"

    $splat = @{
        "Method" = "GET"
        "Uri" = $uri
        "Body" = @{
            "zone" = $Zone
            "date" = $convertedDate
            "key" = $key
        }
    }
    Invoke-RestMethod @splat
}