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
        # The name of the realm to get
        [Parameter(Mandatory)]
        [String] $Name
    )
    return $Script:WoW_Realms | Where-Object Name -Match $Name
}
