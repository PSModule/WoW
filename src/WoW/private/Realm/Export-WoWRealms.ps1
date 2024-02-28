Function Export-WoWRealm {
    Get-WoWRealm | ConvertTo-Json -EnumsAsStrings | Out-File -FilePath "$Script:WoW_Folder_Cache\Realms.json" -Force
}
