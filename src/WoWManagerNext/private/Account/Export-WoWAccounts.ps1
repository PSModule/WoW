Function Export-WoWAccounts {
    Get-WoWAccount | ConvertTo-Json -EnumsAsStrings | Out-File -FilePath "$Script:WoW_Folder_Cache\Accounts.json" -Force
}