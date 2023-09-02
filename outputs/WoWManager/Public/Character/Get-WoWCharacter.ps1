Function Get-WoWCharacter {
    [CmdletBinding()]
    param (
        [String]
        $Name
    )
    return $Script:WoW_Characters | Where-Object Name -match $Name
}