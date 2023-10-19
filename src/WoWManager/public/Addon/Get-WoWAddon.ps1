Function Get-WoWAddon {
    [CmdletBinding()]
    [OutputType([Addon[]])]
    param(
        [String]
        $Name
    )
    return $Script:WoW_Addons | Where-Object Name -Match $Name
}
