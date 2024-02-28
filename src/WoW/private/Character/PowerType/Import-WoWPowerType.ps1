Function Import-WoWPowerType {
    $CacheFilePath = "$Script:WoW_Folder_Cache\PowerType.json"
    if (Test-Path $CacheFilePath) {
        $ImportedPowerTypes = Get-Content $CacheFilePath | ConvertFrom-Json
        foreach ($ImportedPowerType in $ImportedPowerTypes) {
            [PowerType]::new()
        }
    } else {
        Write-WoWVerbose 'Import-WoWCharacter: Nothing to import'
    }
}
