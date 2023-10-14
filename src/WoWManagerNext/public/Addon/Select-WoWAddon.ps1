Function Select-WoWAddon {
    [CmdletBinding()]
    [OutputType([Addon[]])]
    param()
    return $Script:WoW_Addons | Out-GridView -Title "WoWManager - Installed WoW Addons" -OutputMode Multiple
}