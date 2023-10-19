Function Set-WoWAccount {
    [cmdletbinding()]
    param(
        [parameter(mandatory)]
        [String]
        $Name,
        [bool]
        $IsMain
    )

    [Account]$Account = Get-WoWAccount | Where-Object Name -Match $Name
    $Account.IsMain = $IsMain
    Export-WoWAccounts
}
