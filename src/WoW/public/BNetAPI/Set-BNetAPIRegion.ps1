
Function Set-BNetAPIRegion {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions', '', Scope = 'Function',
        Justification = 'Not changing state, just an object in memory.'
    )]
    [CmdletBinding()]
    param(
        [BNetAPIRegion]
        $Region
    )
    $Script:BNetAPI_Settings = $Script:BNetAPI_RegionSettings[$Region]
    Export-BNetAPISetting
}
