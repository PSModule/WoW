function Get-WoWCharacter {
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
    return $Script:WoW_Characters | Where-Object Name -Match $Name
}
