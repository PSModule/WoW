function Set-WoWAccount {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Name
    Parameter description

    .PARAMETER IsMain
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
    [cmdletbinding()]
    param(
        [parameter(mandatory)]
        [String]
        $Name,
        [bool]
        $IsMain
    )

    [Account]$Account = Get-WoWAccount | Where-Object Name -Match $Name
    $Account.IsMain = $IsMain
    Export-WoWAccount
}
#SkipTest:FunctionTest:Difficult to test due to the nature of the function.
