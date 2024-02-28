Function Import-BNetAPISetting {
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
    [CmdletBinding()]
    param()
    Write-WoWVerbose 'Import-BNetAPISetting: Import: Start'
    $CacheFilePath = "$Script:WoW_Folder_Cache\BNetAPISettings.json"
    if (Test-Path $CacheFilePath) {
        $ImportedBNetAPISettings = Get-Content $CacheFilePath | ConvertFrom-Json
        Write-WoWVerbose "Import-BNetAPISetting: Import: Setting region to $($ImportedBNetAPISettings.Region)"
        Set-BNetAPIRegion -Region $ImportedBNetAPISettings.Region
        Write-WoWVerbose 'Import-BNetAPISetting: Import: Done'
    } else {
        Write-WoWVerbose 'Import-BNetAPISetting: Import: Nothing to import'
    }
}
