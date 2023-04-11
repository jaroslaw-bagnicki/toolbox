param(
    [Parameter(Mandatory=$True)]
    [string]$PlaylistId
)

$ErrorActionPreference = "Stop"

$apiUrl = "https://www.googleapis.com/youtube/v3"
$apiKey = Get-Content -Path ".\apiKey"

$playlistItemsPageToken = $null
$output = @()
do {
    # https://developers.google.com/youtube/v3/docs/playlistItems/list
    $playlistItemsRequest = @{
        Method = "GET"
        Uri = "$apiUrl/playlistItems"
        Body = @{
            key = $apiKey
            playlistId = $PlaylistId
            part = "snippet"
            maxResults = 50
            pageToken = $playlistItemsPageToken
        }
    }

    $playlistItemsResponse = Invoke-WebRequest @playlistItemsRequest

    if ($response.StatusCode -ge 400) {
        Write-Error $response.Content
        exit -1
    }

    $playlistItemsResult = ConvertFrom-Json $playlistItemsResponse.Content
    $playlistItemsPageToken = $playlistItemsResult.NextPageToken

    $videoIds = $playlistItemsResult.Items.Snippet.ResourceId.VideoId
    # https://developers.google.com/youtube/v3/docs/videos/list
    $videosRequest = @{
        Method = "GET"
        Uri = "$apiUrl/videos"
        Body = @{
            key = $apiKey
            id = $videoIds -join ","
            part = "contentDetails"
            maxResults = 50
        }
    }

    $videosResponse = Invoke-WebRequest @videosRequest
    if ($response.StatusCode -ge 400) {
        Write-Error $response.Content
        exit -1
    }

    $videosResult = ConvertFrom-Json $videosResponse.Content

    foreach ($playlistItem in $playlistItemsResult.Items.Snippet)
    {
        $videoId = $playlistItem.ResourceId.VideoId
        $videoDetails = $videosResult.Items | Where-Object Id -eq $videoId
        
        $entry = [PSCustomObject]@{
            VideoId = $videoId
            Position = $playlistItem.Position
            Title = $playlistItem.Title
            Duration = [System.Xml.XmlConvert]::ToTimeSpan($videoDetails.ContentDetails.Duration) # Workaround for parsing ISO-8601 timespan format e.g. PT10M45S -> 0:10:45
        }
        $output += $entry
    }
} while ($null -ne $playlistItemsPageToken)

Write-Output $output

