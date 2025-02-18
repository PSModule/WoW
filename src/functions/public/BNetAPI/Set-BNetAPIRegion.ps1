
function Set-BNetAPIRegion {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Region
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
        [BNetAPIRegion]
        $Region
    )
    $Script:BNetAPI_Settings = $Script:BNetAPI_RegionSettings[$Region]
    Export-BNetAPISetting
}
#SkipTest:FunctionTest:Difficult to test due to the nature of the function.
