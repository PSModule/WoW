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
Function Invoke-WoWManager {
    [CmdletBinding()]
    param()
    #Common date format
    $Script:WoW_DateFormat = 'yyyyMMdd-HHmmss'

    $Script:WoW_Folder_Root = Find-WoWFolder
    $Script:WoW_Folder_WTF = Get-Item "$Script:WoW_Folder_Root\WTF"
    $Script:WoW_Folder_Accounts = Get-Item "$Script:WoW_Folder_WTF\Account"
    $Script:WoW_Folder_Addons = Get-Item "$Script:WoW_Folder_Root\Interface\addons"

    #Location for saving data
    $Script:WoW_Folder_Cache = Get-WoWCacheFolder -FolderPath "$env:appdata\WoWManager"

    #Preparing connection with BNet API
    $Script:BNetAPI_AccessToken = New-BNetAPIUserAccessToken
    Import-BNetAPISetting
    Export-BNetAPISetting

    #Collecting info from the game folder
    [Addon[]]$Script:WoW_Addons = Initialize-WoWAddon -WoWAddonsFolderPath $Script:WoW_Folder_Addons
    [Account[]]$Script:WoW_Accounts = Initialize-WoWAccount -WoWAccountsFolderPath $Script:WoW_Folder_Accounts
    Import-WoWAccount
    Export-WoWAccount

    #[Realm[]]$Script:WoW_Realms = Initialize-WoWRealm -WoWAccountsFolderPath $Script:WoW_Folder_Accounts
    [Realm[]]$Script:WoW_Realms = Import-WoWRealm
    Export-WoWRealm

    [PowerType[]]$Script:WoW_PowerTypes = Update-WoWPowerTypes

    [Character[]]$Script:WoW_Characters = Initialize-WoWCharacter -WoWAccountsFolderPath $Script:WoW_Folder_Accounts
    Import-WoWCharacter
    Export-WoWCharacter
}
