
Function Set-WoWCharacter {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions', '', Scope = 'Function',
        Justification = 'Not changing state, just an object in memory.'
    )]
    [Cmdletbinding()]
    param(
        [parameter(mandatory)]
        [String]
        $Name,
        [parameter(mandatory)]
        [String]
        $Realm,
        [bool]
        $IsMain,
        [bool]
        $IsMainForClass,
        [string]
        $ClassName
    )

    $Character = [Character]($Script:WoW_Characters | Where-Object { ($_.Realm.Name -match $Realm) -and ($_.Name -match $Name) } | Select-Object -First 1)
    if ($Character.count -eq 1) {
        if ($PSBoundParameters.ContainsKey('IsMain')) {
            $Character.IsMain = $IsMain
        }
        if ($PSBoundParameters.ContainsKey('IsMainForClass')) {
            $Character.IsMainForClass = $IsMainForClass
        }
        if ($PSBoundParameters.ContainsKey('ClassName')) {
            $Character.Class = $Script:WoW_Classes | Where-Object Name -Match $ClassName
        }

        Export-WoWCharacter
    }
}
