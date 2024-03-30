Function Initialize-WoWRealm {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER WoWAccountsFolderPath
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    [OutputType([Realm[]])]
    Param(
        $WoWAccountsFolderPath = $Script:WoW_Folder_Accounts
    )
    [Realm[]]$Realms = $null

    Write-WoWVerbose 'Realms: Finding'
    $AccountFolders = $WoWAccountsFolderPath | Get-ChildItem -Directory | Where-Object Name -NE SavedVariables
    $RealmNames = $AccountFolders | Get-ChildItem -Directory | Where-Object Name -NE SavedVariables | Select-Object -ExpandProperty Name -Unique
    Write-WoWVerbose "Realms: Found $($RealmNames.count)"

    Write-WoWVerbose 'Realms: Processing'
    $i = 0
    # $AccountFolder = $AccountFolders | Where-Object name -match "Catchius"
    foreach ($RealmName in $RealmNames) {
        $i++
        $Status = "$i/$($RealmNames.count)"
        Write-WoWVerbose "Realms: Processing: $Status $RealmName"

        $Realm = [Realm]::new($RealmName)
        $Realms += $Realm

        Write-WoWVerbose "Realms: Processing: $Status $($RealmName): Done"
    }

    Write-WoWVerbose 'Realms: Processing: Done'
    return $Realms | Sort-Object name
}
