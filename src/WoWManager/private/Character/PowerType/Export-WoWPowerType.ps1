Function Export-WoWPowerType {

    [CmdletBinding()]
    param ()

    Get-WoWPowerType | ConvertTo-Json -EnumsAsStrings | Out-File -FilePath "$Script:WoW_Folder_Cache\PowerType.json" -Force
}
