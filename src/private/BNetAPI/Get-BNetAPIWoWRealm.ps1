Function Get-BNetAPIWoWRealm {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param()
    Write-WoWVerbose 'Get-BNetAPIWoWRealm: Finding'
    [Realm[]]$Realms = $null

    $Headers = @{
        'Battlenet-Namespace' = $Script:BNetAPI_Settings.WoWNameSpace.Dynamic
        Authorization         = "Bearer $Script:BNetAPI_AccessToken"
    }
    $APIURI = $Script:BNetAPI_Settings.APIURI
    $Locale = $Script:BNetAPI_Settings.Locale

    $RawRealmIndex = Invoke-RestMethod -Method Get -Uri "$($APIURI)data/wow/realm/index?locale=$($Locale)" -Headers $Headers
    $RawRealmIndex.realms | ForEach-Object -ThrottleLimit 50 -Parallel {
        $params = @{
            Method  = 'Get'
            Uri     = "$using:APIURI/data/wow/realm/$($_.id)?namespace=dynamic-eu&locale=$using:Locale"
            Headers = $using:Headers
        }
        Invoke-RestMethod @params
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
