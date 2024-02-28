Function Set-WoWAccount {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions', '', Scope = 'Function',
        Justification = 'Not changing state, just an object in memory.'
    )]
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
    Export-WoWAccount
}
