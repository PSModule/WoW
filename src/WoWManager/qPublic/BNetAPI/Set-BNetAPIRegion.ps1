
Function Set-BNetAPIRegion {
    [CmdletBinding()]
    param(
        [BNetAPIRegion]
        $Region
    )
    $Script:BNetAPI_Settings = $Script:BNetAPI_RegionSettings[$Region]
    Export-BNetAPISettings
}