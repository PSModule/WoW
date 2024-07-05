
#https://develop.battle.net/documentation/guides/using-oauth/client-credentials-flow
function New-BNetAPIUserAccessToken {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER ClientID
    Parameter description

    .PARAMETER ClientSecret
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
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
        $params = @{
            Method      = 'Post'
            Uri         = "$($Script:BNetAPI_Settings.BNetAPIPath)oauth/token"
            Body        = $Body
            ContentType = 'application/x-www-form-urlencoded'
            ErrorAction = 'Stop'
        }
        $Response = Invoke-RestMethod @params
    } catch {
        throw $_
    }
    return $Response.access_token
}
