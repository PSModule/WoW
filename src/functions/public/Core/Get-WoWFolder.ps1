function Get-WoWFolder {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Folder
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param(
        [ValidateSet('All', 'Root', 'Account', 'WTF', 'Cache')]
        [String]
        $Folder = 'Root'
    )
    switch ($Folder) {
        'All' {
            return Get-Variable -Scope Script -Name WoW_Folder_* | Sort-Object Value
        }
        'Root' {
            return $Script:WoW_Folder_Root
        }
        'Account' {
            return $Script:WoW_Folder_Account
        }
        'WTF' {
            return $Script:WoW_Folder_WTF
        }
        'Cache' {
            return $Script:WoW_Folder_Cache
        }
        default {}
    }
}
