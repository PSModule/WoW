
Function Get-BNetAPIUserInfo {
    [CmdletBinding()]
    param(
        $Token = $Script:BNetAPI_AccessToken
    )
    $Headers = @{
        Authorization = "Bearer $Token"
    }

    try {
        $Response = Invoke-RestMethod -Method Get -Uri "$($Script:BNetAPI_Settings.BNetAPIPath)oauth/userinfo" -Headers $Headers -ContentType 'application/x-www-form-urlencoded' -ErrorAction Stop
    } catch {
        throw $_
    }
    return $Response
}
