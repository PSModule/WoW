Function Get-WoWFolder {
    param(
        [ValidateSet('All','Root',"Account","WTF","Cache")]
        [String]
        $Folder = "Root"
    )
    switch ($Folder) {
        "All" {
            return Get-Variable -Scope Script -Name WoW_Folder_* | Sort-Object Value    
        }
        "Root" {
            return $Script:WoW_Folder_Root
        }
        "Account" {
            return $Script:WoW_Folder_Account
        }
        "WTF" {
            return $Script:WoW_Folder_WTF
        }
        "Cache" {
            return $Script:WoW_Folder_Cache
        }
        Default {}
    }
}