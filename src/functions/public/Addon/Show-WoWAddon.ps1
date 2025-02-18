function Show-WoWAddon {
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
    [OutputType([void])]
    param()
    $Script:WoW_Addons | Out-GridView -Title 'WoWManager - Installed WoW Addons'
}
#SkipTest:FunctionTest:Difficult to test due to the nature of the function.
