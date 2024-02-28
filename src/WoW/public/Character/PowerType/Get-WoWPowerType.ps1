Function Get-WoWPowerType {
    [CmdletBinding()]
    param (
        [String]
        $Name
    )
    return $Script:WoW_PowerTypes | Where-Object Name -Match $Name
}
