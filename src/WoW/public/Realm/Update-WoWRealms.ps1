Function Update-WoWRealm {
    [CmdletBinding()]
    param()
    [Realm[]]$Realms = $null
    $Headers = @{
        'Battlenet-Namespace' = $Script:BNetAPI_Settings.WoWNameSpace.Dynamic
        Authorization         = "Bearer $Script:BNetAPI_AccessToken"
    }
    $APIURI = $Script:BNetAPI_Settings.APIURI
    $Locale = $Script:BNetAPI_Settings.Locale
    #$ApplicableRealms = $Script:WoW_Realms.Name

    Write-WoWVerbose 'Update-WoWRealm: Finding realms online'
    $RealmIndex = Invoke-RestMethod -Method Get -Uri "$($APIURI)data/wow/realm/index?locale=$Locale" -Headers $Headers
    $RealmsToUpdate = $RealmIndex.realms # | Where-Object Name -In -Value $ApplicableRealms
    $RealmsToUpdate | ForEach-Object -ThrottleLimit 50 -Parallel {
        Invoke-RestMethod -Method Get -Uri "$($using:APIURI)data/wow/realm/$($_.id)?locale=$using:Locale" -Headers $using:Headers
    } | ForEach-Object {
        $Realms += [Realm]::new(
            $_.id,
            $_.name,
            $_.region.name,
            $_.category,
            $_.locale,
            $_.timezone,
            $_.type.name,
            $_.is_tournament,
            $_.slug)
    }
    return $Realms
}
