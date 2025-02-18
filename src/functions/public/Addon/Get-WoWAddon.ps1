function Get-WoWAddon {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Name
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    [OutputType([Addon[]])]
    param(
        [String]
        $Name
    )
    return $Script:WoW_Addons | Where-Object Name -Match $Name
}
#SkipTest:FunctionTest:Difficult to test due to the nature of the function.
