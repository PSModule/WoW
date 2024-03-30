
Function Get-BNetAPIUserAccessToken {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Token
    Parameter description

    .PARAMETER Region
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param(
        $Token = $Script:BNetAPI_AccessToken,
        $Region = $Script:BNetAPI_Settings.Region
    )
    $Body = @{
        ':region' = $Region
        token     = $Token
    }

    try {
        $params = @{
            Method      = 'Post'
            Uri         = "$($Script:BNetAPI_Settings.BNetAPIPath)oauth/check_token"
            Body        = $Body
            ContentType = 'application/x-www-form-urlencoded'
            ErrorAction = 'Stop'
        }

        $Response = Invoke-RestMethod @params
    } catch {
        throw $_
    }
    return $Response
}
