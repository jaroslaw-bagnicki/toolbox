$config = Import-PowerShellDataFile -Path (Join-Path $PSScriptRoot ".\config.psd1")

$playlistId = "PLxfrSxK7P38X7XfG4X8Y9cdOURvC7ObMF"

# https://developers.google.com/youtube/v3/docs/playlistItems/list
$request = @{
    Method = "GET"
    Uri = "$($config.ApiUrl)/playlistItems"
    Body = @{
        key = $config.ApiKey
        playlistId = $playlistId
        part = "snippet,contentDetails"
        maxResults = 50
        pageToken = $null
    }
}

$items = @()
do {
    $response = Invoke-WebRequest @request

    if ($response.StatusCode -ge 400) {
        Write-Error $response.Content
        exit -1
    }

    $result = ConvertFrom-Json $response.Content
    $request.Body.pageToken = $result.NextPageToken
    $items += $result.Items
} while ($null -ne $result.NextPageToken)

$items




