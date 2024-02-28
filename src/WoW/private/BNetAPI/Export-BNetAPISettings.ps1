Function Export-BNetAPISettings {
    [CmdletBinding()]
    param()
    Write-WoWVerbose 'Export-BNetAPISettings: Export: Start'
    Get-BNetAPIRegion | Select-Object Region | ConvertTo-Json -EnumsAsStrings | Out-File -FilePath "$Script:WoW_Folder_Cache\BNetAPISettings.json" -Force
    Write-WoWVerbose 'Export-BNetAPISettings: Export: Done'
}
