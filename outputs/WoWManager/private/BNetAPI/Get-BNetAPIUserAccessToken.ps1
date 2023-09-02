
Function Get-BNetAPIUserAccessToken {
    [CmdletBinding()]
    param(
        $Token = $Script:BNetAPI_AccessToken,
        $Region = $Script:BNetAPI_Settings.Region
    )
    $Body = @{
        ":region" = $Region
        token     = $Token
    }
    
    try {
        $Response = Invoke-RestMethod -Method Post -Uri "$($Script:BNetAPI_Settings.BNetAPIPath)oauth/check_token" -Body $Body -ContentType "application/x-www-form-urlencoded" -ErrorAction Stop
    } catch {
        throw $_
    }
    return $Response
}