function Get-BNetAPIRegion {
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
    return $Script:BNetAPI_Settings
}
#SkipTest:FunctionTest:Difficult to test due to the nature of the function.
