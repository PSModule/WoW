Function Get-WoWRealm {
    [CmdletBinding()]
    [OutputType([Addon[]])]
    param(
        [String]
        $Name
    )
    return $Script:WoW_Realms | Where-Object Name -match $Name
}