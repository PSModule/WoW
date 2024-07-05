function Get-WoWRealm {
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
    return $Script:WoW_Realms | Where-Object Name -Match $Name
}
