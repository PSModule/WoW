Function Show-WoWAccount {
    [CmdletBinding()]
    [OutputType([void])]
    param()
    $Script:WoW_Account | Out-GridView -Title 'WoWManager - List WoW Accounts'
}
