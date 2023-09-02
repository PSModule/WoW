Function Show-WoWAddon {
    [CmdletBinding()]
    [OutputType([void])]
    param()
    $Script:WoW_Addons | Out-GridView -Title "WoWManager - Installed WoW Addons"
}