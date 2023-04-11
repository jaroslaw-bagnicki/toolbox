$config = Import-PowerShellDataFile -Path (Join-Path $PSScriptRoot ".\config.psd1")

$playlistId = "PLxfrSxK7P38X7XfG4X8Y9cdOURvC7ObMF"

# https://developers.google.com/youtube/v3/docs/playlistItems/list
# GET https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&maxResults=25&playlistId=PLxfrSxK7P38X7XfG4X8Y9cdOURvC7ObMF&key=[YOUR_API_KEY] HTTP/1.1
$request = @{
    Method = "GET"
    Uri = "$($config.ApiUrl)/playlistItems"
    Body = @{
        key = $config.ApiKey
        playlistId = $playlistId
        part = "snippet"
        maxResults = 50
    }
}

$response = Invoke-WebRequest @request

if ($response.StatusCode -ge 400) {
    Write-Error $response.Content
    exit -1
}

$result = ConvertFrom-Json $response.Content
$result.Items



