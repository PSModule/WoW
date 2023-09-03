Function Import-WoWRealms {
    [Realm[]]$Realms = $null
    $CacheFilePath = "$Script:WoW_Folder_Cache\Realms.json"
    if (Test-Path $CacheFilePath) {
        $ImportedRealms = Get-Content $CacheFilePath | ConvertFrom-Json
        #$ImportedRealm = $ImportedRealms[0]
        foreach ($ImportedRealm in $ImportedRealms) {
            $Realm = [Realm]::new()
            $Realm.ID = $ImportedRealm.ID
            $Realm.Region = $ImportedRealm.Region
            $Realm.Category = $ImportedRealm.Category
            $Realm.Locale = $ImportedRealm.Locale
            $Realm.Timezone = $ImportedRealm.Timezone
            $Realm.Type = $ImportedRealm.Type
            $Realm.IsTournament = $ImportedRealm.IsTournament
            $Realm.Slug = $ImportedRealm.Slug
            $Realms += $Realm
        }
        return $Realms
    } else {
        Write-WoWVerbose "Import-WoWRealms: Nothing to import"
        return
    }
}
