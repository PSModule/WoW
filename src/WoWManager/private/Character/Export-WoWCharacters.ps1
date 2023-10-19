Function Export-WoWCharacters {
    Get-WoWCharacter | ConvertTo-Json -EnumsAsStrings | Out-File -FilePath "$Script:WoW_Folder_Cache\Characters.json" -Force
}
