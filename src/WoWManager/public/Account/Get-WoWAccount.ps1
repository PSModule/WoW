Function Get-WoWAccount {
    [CmdletBinding()]
    param (
        [String]
        $Name
    )
    return $Script:WoW_Accounts | Where-Object Name -Match $Name
}
