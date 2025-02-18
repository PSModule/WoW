function Show-WoWAccount {
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
    $Script:WoW_Account | Out-GridView -Title 'WoWManager - List WoW Accounts'
}
#SkipTest:FunctionTest:Difficult to test due to the nature of the function.
