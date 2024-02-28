Function Import-WoWAccount {
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
    $CacheFilePath = "$Script:WoW_Folder_Cache\Accounts.json"
    if (Test-Path $CacheFilePath) {
        $ImportedAccounts = Get-Content $CacheFilePath | ConvertFrom-Json
        foreach ($ImportedAccount in $ImportedAccounts) {
            $Account = [Account]($Script:WoW_Accounts | Where-Object Name -Match $ImportedAccount.Name | Select-Object -First 1)
            $Account.IsMain = $ImportedAccount.IsMain
        }
    } else {
        Write-WoWVerbose 'Import-WoWAccount: Nothing to import'
    }
}
