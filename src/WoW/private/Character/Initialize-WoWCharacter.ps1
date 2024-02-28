Function Initialize-WoWCharacter {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER WoWAccountsFolderPath
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [Cmdletbinding()]
    param(
        $WoWAccountsFolderPath = $Script:WoW_Folder_Accounts
    )
    [Character[]]$Characters = $null

    Write-WoWVerbose 'Characters: Finding'
    $AccountFolders = $WoWAccountsFolderPath | Get-ChildItem -Directory | Where-Object Name -NE SavedVariables
    $RealmFolders = $AccountFolders | Get-ChildItem -Directory | Where-Object Name -NE SavedVariables
    $CharFolders = $RealmFolders | Get-ChildItem -Directory | Where-Object Name -NE SavedVariables | Sort-Object name
    Write-WoWVerbose "Characters: Found $($CharFolders.count)"

    Write-WoWVerbose 'Characters: Processing'
    $i = 0
    Foreach ($CharFolder in $CharFolders) {
        $i++
        $Status = "$i/$($CharFolders.count)"
        Write-WoWVerbose "Characters: Processing: $Status $($CharFolder.Name)"

        $Char = [Character]::new()
        $Char.FolderPath = $CharFolder
        $CharFolderCN = ($CharFolder -split ('\\'))
        $CharName = $CharFolderCN[-1]
        $CharRealmName = $CharFolderCN[-2]
        $CharAccountName = $CharFolderCN[-3]
        $Char.Name = $CharName
        $Char.Realm = $Script:WoW_Realms | Where-Object Name -EQ $CharRealmName
        $Char.Account = $Script:WoW_Accounts | Where-Object Name -EQ $CharAccountName
        $Char.Account.Characters += $Char
        $Char.IsMainForClass = $false
        $Char.IsMain = $false
        $Char.SettingsFolderPath = "$($Char.FolderPath)\SavedVariables"
        $Char.AddOnsFilePath = "$($Char.FolderPath)\AddOns.txt"
        $Char.BindingsCachePath = "$($Char.FolderPath)\bindings-cache.wtf"
        $Char.ConfigCachePath = "$($Char.FolderPath)\config-cache.wtf"
        $Char.MacrosCachePath = "$($Char.FolderPath)\macros-cache.txt"
        $Characters += $Char

        Write-WoWVerbose "Characters: Processing: $Status $($CharFolder.Name): Done"
    }

    Write-WoWVerbose 'Characters: Processing: Done'
    return $Characters | Sort-Object name
}
