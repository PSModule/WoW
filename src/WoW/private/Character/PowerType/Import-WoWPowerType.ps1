Function Import-WoWPowerType {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
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
