Function Export-BNetAPISetting {
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
    Write-WoWVerbose 'Export-BNetAPISetting: Export: Start'
    Get-BNetAPIRegion | Select-Object Region | ConvertTo-Json -EnumsAsStrings | Out-File -FilePath "$Script:WoW_Folder_Cache\BNetAPISettings.json" -Force
    Write-WoWVerbose 'Export-BNetAPISetting: Export: Done'
}
