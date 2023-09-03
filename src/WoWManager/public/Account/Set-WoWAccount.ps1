Function Set-WoWAccount {
    [cmdletbinding()]
    param(
        [parameter(mandatory)]
        [String]
        $Name,
        [bool]
        $IsMain
    )

    [Account]$Account = Get-WoWAccount | Where-Object Name -match $Name
    $Account.IsMain = $IsMain
    Export-WoWAccounts
}