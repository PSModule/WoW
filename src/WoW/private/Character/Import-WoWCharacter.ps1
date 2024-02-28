Function Import-WoWCharacter {
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
    $CacheFilePath = "$Script:WoW_Folder_Cache\Characters.json"
    if (Test-Path $CacheFilePath) {
        $ImportedCharacters = Get-Content $CacheFilePath | ConvertFrom-Json
        foreach ($ImportedCharacter in $ImportedCharacters) {
            $Character = [Character]($Script:WoW_Characters | Where-Object { ($_.Realm.Name -match $ImportedCharacter.Realm.Name) -and ($_.Name -match $ImportedCharacter.Name) } | Select-Object -First 1)
            $Character.ID = $ImportedCharacter.ID
            $Character.Gender = $ImportedCharacter.Gender
            $Character.Faction = $ImportedCharacter.Faction
            $Character.Race = $ImportedCharacter.Race
            $Character.IsMainForClass = $ImportedCharacter.IsMainForClass
            $Character.IsMain = $ImportedCharacter.IsMain
            $Character.Level = $ImportedCharacter.Level
            $Character.Guild = $ImportedCharacter.Guild
            $Character.AchievementPoints = $ImportedCharacter.AchievementPoints
            $Character.LastPlayed = [datetime]$ImportedCharacter.LastPlayed
            $Character.averageItemLevel = $ImportedCharacter.averageItemLevel
            $Character.averageItemLevelEquipped = $ImportedCharacter.averageItemLevelEquipped
            $Character.Gold = $ImportedCharacter.Gold
            $Character.PlayedLevel = (New-TimeSpan).Add($ImportedCharacter.PlayedLevel.Ticks)
            $Character.PlayedTotal = (New-TimeSpan).Add($ImportedCharacter.PlayedTotal.Ticks)
            $Character.isResting = $ImportedCharacter.isResting
            $Character.ArtifactLevel = $ImportedCharacter.ArtifactLevel
            $Character.ArtifactProgress = $ImportedCharacter.ArtifactProgress
            $Character.Zone = $ImportedCharacter.Zone
            $Character.Warmode = $ImportedCharacter.Warmode
            $Character.HasNewMail = $ImportedCharacter.HasNewMail
            $Character.Durability = $ImportedCharacter.Durability
        }
    } else {
        Write-WoWVerbose 'Import-WoWCharacter: Nothing to import'
    }
}
