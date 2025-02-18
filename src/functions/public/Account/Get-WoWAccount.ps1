function Get-WoWAccount {
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
    param (
        [String]
        $Name
    )
    return $Script:WoW_Accounts | Where-Object Name -Match $Name
}
#SkipTest:FunctionTest:Difficult to test due to the nature of the function.
