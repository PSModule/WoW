function Export-WoWPowerType {
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
    param ()

    Get-WoWPowerType | ConvertTo-Json -EnumsAsStrings | Out-File -FilePath "$Script:WoW_Folder_Cache\PowerType.json" -Force
}
