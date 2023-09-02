Function Import-BNetAPISettings {
    [CmdletBinding()]
    param()
    Write-WoWVerbose "Import-BNetAPISettings: Import: Start"
    $CacheFilePath = "$Script:WoW_Folder_Cache\BNetAPISettings.json"
    if (Test-Path $CacheFilePath) {
        $ImportedBNetAPISettings = Get-Content $CacheFilePath | ConvertFrom-Json
        Write-WoWVerbose "Import-BNetAPISettings: Import: Setting region to $($ImportedBNetAPISettings.Region)"
        Set-BNetAPIRegion -Region $ImportedBNetAPISettings.Region
        Write-WoWVerbose "Import-BNetAPISettings: Import: Done"
    } else {
        Write-WoWVerbose "Import-BNetAPISettings: Import: Nothing to import"
    }
}