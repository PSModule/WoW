function Export-WoWRealm {
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
    Get-WoWRealm | ConvertTo-Json -EnumsAsStrings | Out-File -FilePath "$Script:WoW_Folder_Cache\Realms.json" -Force
}
