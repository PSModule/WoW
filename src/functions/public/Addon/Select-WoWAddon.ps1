function Select-WoWAddon {
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
    [OutputType([Addon[]])]
    param()
    return $Script:WoW_Addons | Out-GridView -Title 'WoWManager - Installed WoW Addons' -OutputMode Multiple
}
