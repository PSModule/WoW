function Update-WoWPowerType {
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
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions', '', Scope = 'Function',
        Justification = 'Not changing state, just an object in memory.'
    )]
    [CmdletBinding()]
    param()

    [PowerType[]]$PowerTypes = $null
    $Headers = @{
        'Battlenet-Namespace' = $Script:BNetAPI_Settings.WoWNameSpace.Static
        Authorization         = "Bearer $Script:BNetAPI_AccessToken"
    }
    $APIURI = $Script:BNetAPI_Settings.APIURI
    $Locale = $Script:BNetAPI_Settings.Locale

    Write-WoWVerbose 'Update-WoWPowerTypes: Finding PowerTypes online'
    $PowerTypeIndex = Invoke-RestMethod -Method Get -Uri "$($APIURI)data/wow/power-type/index?locale=$Locale" -Headers $Headers
    $PowerTypeIndex.power_types | ForEach-Object -Parallel {
        Invoke-RestMethod -Method Get -Uri "$($using:APIURI)data/wow/power-type/$($_.id)?&locale=$using:Locale" -Headers $using:Headers
    } | ForEach-Object {
        $PowerTypes += [PowerType]::new($_.id, $_.name)
    }
    return $PowerTypes
}
