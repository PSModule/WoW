using module ..\..\classes\classes.psm1

Function Initialize-WoWAccounts {
    [CmdletBinding()]
    [OutputType([Account[]])]
    Param(
        $WoWAccountsFolderPath = $Script:WoW_Folder_Accounts
    )
    [Account[]]$Accounts = $null

    Write-WoWVerbose "Accounts: Finding"
    $AccountFolders = $WoWAccountsFolderPath | Get-ChildItem -Directory | Where-Object Name -NE SavedVariables | Select-Object Name, FullName | Sort-Object name
    Write-WoWVerbose "Accounts: Found $($AccountFolders.count)"
    
    Write-WoWVerbose "Accounts: Processing"
    $i = 0
    foreach ($AccountFolder in $AccountFolders) {
        $i++
        $Status = "$i/$($AccountFolders.count)"
        Write-WoWVerbose "Accounts: Processing: $Status $($AccountFolder.Name)"

        $Account = [Account]::new($AccountFolder.Name)
        $Account.FolderPath = $AccountFolder.FullName
        $Account.SettingsFolderPath = "$($Account.FolderPath)\SavedVariables"
        $Account.ConfigCachePath = "$($Account.FolderPath)\config-cache.wtf"
        $Account.BindingsCachePath = "$($Account.FolderPath)\bindings-cache.wtf"
        $Account.MacrosCachePath = "$($Account.FolderPath)\macros-cache.txt"
        $Account.IsMain = $false
        $Accounts += $Account
        Write-WoWVerbose "Accounts: Processing: $Status $($AccountFolder.Name): Done"
    }
    Write-WoWVerbose "Accounts: Processing: Done"
    return $Accounts | Sort-Object name
}