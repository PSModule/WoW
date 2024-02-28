
#https://develop.battle.net/documentation/guides/using-oauth/client-credentials-flow
Function New-BNetAPIUserAccessToken {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions', '', Scope = 'Function',
        Justification = 'Not changing state, just an object in memory.'
    )]
    [CmdletBinding()]
    param(
        $ClientID = $Script:BNetAPI_ClientID,
        $ClientSecret = $Script:BNetAPI_ClientSecret
    )
    $Body = @{
        client_id     = $ClientID
        client_secret = $ClientSecret
        grant_type    = 'client_credentials'
        scope         = ''
    }

    try {
        $Response = Invoke-RestMethod -Method 'Post' -Uri "$($Script:BNetAPI_Settings.BNetAPIPath)oauth/token" -Body $Body -ContentType 'application/x-www-form-urlencoded' -ErrorAction Stop
    } catch {
        throw $_
    }
    return $Response.access_token
}
