Function Import-WoWAccounts {
    $CacheFilePath = "$Script:WoW_Folder_Cache\Accounts.json"
    if (Test-Path $CacheFilePath) {
        $ImportedAccounts = Get-Content $CacheFilePath | ConvertFrom-Json
        foreach ($ImportedAccount in $ImportedAccounts) {
            $Account = [Account]($Script:WoW_Accounts | Where-Object Name -match $ImportedAccount.Name | Select-Object -First 1)
            $Account.IsMain = $ImportedAccount.IsMain
        }
    } else {
        Write-WoWVerbose "Import-WoWAccounts: Nothing to import"
    }
}