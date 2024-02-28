Function Initialize-WoWAddon {
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .PARAMETER WoWAddonsFolderPath
    Parameter description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    [OutputType([Addon[]])]
    Param(
        [Parameter(Mandatory)]
        [string]
        $WoWAddonsFolderPath
    )
    [Addon[]]$Addons = $null

    Write-WoWVerbose 'Addons: Finding'
    $WoWAddonsFolders = $WoWAddonsFolderPath | Get-ChildItem -Directory
    $AddonTOCFiles = $WoWAddonsFolders | Get-ChildItem | Where-Object name -Like *.toc | Sort-Object name
    Write-WoWVerbose "Addons: Found $($AddonTOCFiles.count)"

    Write-WoWVerbose 'Addons: Processing'
    $i = 0
    foreach ($AddonTOCFile in $AddonTOCFiles) {
        $i++
        $Status = "$i/$($AddonTOCFiles.count)"
        Write-WoWVerbose "Addons: Processing: $Status $($AddonTOCFile.Name)"

        $Content = Get-Content -Path $AddonTOCFile.FullName
        $Addon = [Addon]::new()
        $Addon.AddonFilePath = $AddonTOCFile.FullName
        $Addon.AddonFile = $AddonTOCFile.Name
        $SettingsFileName = "$($AddonTOCFile.BaseName).lua"

        # $Line = $Content[0]
        foreach ($Line in $Content) {
            if ($Line -like '*##*Title:*') {
                $Text = ''
                $Text = ($Line -split 'Title:').trim()[-1]
                $Text = $Text.Replace('|r', '')
                $Text = $Text.Replace('|c', '#|')
                $Text = $Text.Split('#')
                $Text = $Text.trim()

                $Title = $null
                # $Part = $Text[0]
                foreach ($Part in $Text) {
                    if ($Part -like '|*') {
                        $Part = $Part.Substring(9)
                    }
                    $Title += $Part
                }
                $Addon.Name = $Title
            }
            if ($Line -like '*##*Interface:*') {
                $Interface = ($Line -split 'Interface:').trim()[-1]
                $Addon.Interface = $Interface
            }
            if ($Line -like '*##*SavedVariables:*') {
                [string[]]$SavedVariables = ($Line -split 'SavedVariables:').trim()
                $SavedVariables = $SavedVariables[1..($SavedVariables.Length - 1)]
                $Addon.SavedVariables = $SavedVariables.split(',').Trim()
                $Addon.AccountSettingsFile = "$SettingsFileName"
                $Addon.AccountSettingsFileBackup = "$SettingsFileName.bak"
            }
            if ($Line -like '*##*SavedVariablesPerCharacter:*') {
                [string[]]$SavedVariablesPerCharacter = ($Line -split 'SavedVariablesPerCharacter:').trim()
                $SavedVariablesPerCharacter = [string[]]$SavedVariablesPerCharacter[1..($SavedVariablesPerCharacter.Length - 1)]
                $Addon.SavedVariablesPerCharacter = $SavedVariablesPerCharacter.split(',').Trim()
                $Addon.CharacterSettingsFile = "$SettingsFileName"
                $Addon.CharacterSettingsFileBackup = "$SettingsFileName.bak"
            }
            if ($Line -like '*##*RequiredDeps:*') {
                [string[]]$RequiredDeps = ($Line -split 'RequiredDeps:').trim()
                $RequiredDeps = [string[]]$RequiredDeps[1..($RequiredDeps.Length - 1)]
                $RequiredDeps = $RequiredDeps.split(',').Trim()
                $Addon.RequiredDeps = $RequiredDeps
            }
            if ($Line -like '*##*OptionalDeps:*') {
                [string[]]$OptionalDeps = ($Line -split 'OptionalDeps:').trim()
                $OptionalDeps = [string[]]$OptionalDeps[1..($OptionalDeps.Length - 1)]
                $OptionalDeps = $OptionalDeps.split(',').Trim()
                $Addon.OptionalDeps = $OptionalDeps
            }
            if ($Line -like '*##*DefaultState:*') {
                $DefaultState = ($Line -split 'DefaultState:').trim()[-1]
                $Addon.DefaultState = $DefaultState
            }
        }

        $Addons += $Addon
        Write-WoWVerbose "Addons: Processing: $Status $($AddonTOCFile.Name): Done"
    }
    Write-WoWVerbose 'Addons: Processing: Done'
    return $Addons | Sort-Object name
}
