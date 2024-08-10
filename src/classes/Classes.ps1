$script:ClassMap = @(
    [PSCustomObject]@{
        ClassID    = 1
        ClassName  = 'Warrior'
        ColorHex   = '#C79C6E'
        ColorFracR = 0.78
        ColorFracG = 0.61
        ColorFracB = 0.43
        ColorDecR  = 199
        ColorDecG  = 156
        ColorDecB  = 110
    }, #  1 - Warrior
    [PSCustomObject]@{
        ClassID    = 2
        ClassName  = 'Paladin'
        ColorHex   = '#F58CBA'
        ColorFracR = 0.96
        ColorFracG = 0.55
        ColorFracB = 0.73
        ColorDecR  = 245
        ColorDecG  = 140
        ColorDecB  = 186
    }, #  2 - Paladin
    [PSCustomObject]@{
        ClassID    = 3
        ClassName  = 'Hunter'
        ColorHex   = '#ABD473'
        ColorFracR = 0.67
        ColorFracG = 0.83
        ColorFracB = 0.45
        ColorDecR  = 171
        ColorDecG  = 212
        ColorDecB  = 115
    }, #  3 - Hunter
    [PSCustomObject]@{
        ClassID    = 4
        ClassName  = 'Rogue'
        ColorHex   = '#FFF569'
        ColorFracR = 1.00
        ColorFracG = 0.96
        ColorFracB = 0.41
        ColorDecR  = 255
        ColorDecG  = 245
        ColorDecB  = 105
    }, #  4 - Rogue
    [PSCustomObject]@{
        ClassID    = 5
        ClassName  = 'Priest'
        ColorHex   = '#FFFFFF'
        ColorFracR = 1.00
        ColorFracG = 1.00
        ColorFracB = 1.00
        ColorDecR  = 255
        ColorDecG  = 255
        ColorDecB  = 255
    }, #  5 - Priest
    [PSCustomObject]@{
        ClassID    = 6
        ClassName  = 'Death Knight'
        ColorHex   = '#C41F3B'
        ColorFracR = 0.77
        ColorFracG = 0.12
        ColorFracB = 0.23
        ColorDecR  = 196
        ColorDecG  = 31
        ColorDecB  = 59
    }, #  6 - Death Knight
    [PSCustomObject]@{
        ClassID    = 7
        ClassName  = 'Shaman'
        ColorHex   = '#0070DE'
        ColorFracR = 0.00
        ColorFracG = 0.44
        ColorFracB = 0.87
        ColorDecR  = 0
        ColorDecG  = 112
        ColorDecB  = 222
    }, #  7 - Shaman
    [PSCustomObject]@{
        ClassID    = 8
        ClassName  = 'Mage'
        ColorHex   = '#69CCF0'
        ColorFracR = 0.41
        ColorFracG = 0.80
        ColorFracB = 0.94
        ColorDecR  = 105
        ColorDecG  = 204
        ColorDecB  = 240
    }, #  8 - Mage
    [PSCustomObject]@{
        ClassID    = 9
        ClassName  = 'Warlock'
        ColorHex   = '#9482C9'
        ColorFracR = 0.58
        ColorFracG = 0.51
        ColorFracB = 0.79
        ColorDecR  = 148
        ColorDecG  = 130
        ColorDecB  = 201
    }, #  9 - Warlock
    [PSCustomObject]@{
        ClassID    = 10
        ClassName  = 'Monk'
        ColorHex   = '#00FF96'
        ColorFracR = 0.00
        ColorFracG = 1.00
        ColorFracB = 0.59
        ColorDecR  = 0
        ColorDecG  = 255
        ColorDecB  = 150
    }, # 10 - Monk
    [PSCustomObject]@{
        ClassID    = 11
        ClassName  = 'Druid'
        ColorHex   = '#FF7D0A'
        ColorFracR = 1.00
        ColorFracG = 0.49
        ColorFracB = 0.04
        ColorDecR  = 255
        ColorDecG  = 125
        ColorDecB  = 10
    }, # 11 - Druid
    [PSCustomObject]@{
        ClassID    = 12
        ClassName  = 'Demon Hunter'
        ColorHex   = '#A330C9'
        ColorFracR = 0.64
        ColorFracG = 0.19
        ColorFracB = 0.79
        ColorDecR  = 163
        ColorDecG  = 48
        ColorDecB  = 201
    }  # 12 - Demon Hunter
    # Missing Evoker
)

enum Role {
    Tank
    Healer
    Damage
}

enum Faction {
    Alliance = 0
    Horde = 1
    Neutral = 2
}

enum Gender {
    Male = 0
    Female = 1
    Unknown = $null
}

class Account {
    [string]$Name
    [bool]$IsMain
    [string]$FolderPath
    [Character[]]$Characters
    [string]$SettingsFolderPath
    [string]$ConfigCachePath
    [string]$BindingsCachePath
    [string]$MacrosCachePath

    Account (
        [string]$Name
    ) {
        $this.Name = $Name
    }

    [string]ToString() {
        return $this.Name
    }
}

class Addon {
    [string]$Name
    [string]$Interface
    [string]$SavedVariables
    [string]$AccountSettingsFile
    [string]$AccountSettingsFileBackup
    [string]$SavedVariablesPerCharacter
    [string]$CharacterSettingsFile
    [string]$CharacterSettingsFileBackup
    [string]$RequiredDeps
    [string]$OptionalDeps
    [string]$DefaultState
    [string]$AddonFilePath
    [string]$AddonFile

    Addon() {}

    [string]ToString() {
        return $this.Name
    }
}

class AzeriteEssence {
    [string]$Name
    [int]$ID
    [bool]$Valid
    [bool]$Unlocked
    [int]$Icon
    [int]$Rank

    AzeriteEssence(
        [string]$Name,
        [int]$ID,
        [bool]$Valid,
        [bool]$Unlocked,
        [int]$Icon,
        [int]$Rank
    ) {
        $this.Name = $Name
        $this.ID = $ID
        $this.Valid = $Valid
        $this.Unlocked = $Unlocked
        $this.Icon = $Icon
        $this.Rank = $Rank
    }

    [string]ToString() {
        return $this.Name
    }
}

class PlayableClass {
    [UInt16]$ID
    [string]$Name
    [PowerType]$PowerType

    PlayableClass() {}

    PlayableClass(
        [UInt16]$ID,
        [string]$Name,
        [PowerType]$PowerType
    ) {
        $this.ID = $ID
        $this.Name = $Name
        $this.PowerType = $PowerType
    }

    [string]ToString() {
        return $this.Name
    }
}

class Character {
    [UInt16]$ID
    [string]$Name
    [Account]$Account
    [Realm]$Realm
    [string]$Region
    [Gender]$Gender
    [Faction]$Faction
    [Race]$Race
    [PlayableClass]$Class
    [bool]$IsMainForClass
    [bool]$IsMain
    [Specialization]$Specialization
    [UInt16]$Level
    [string]$Guild
    [int]$AchievementPoints
    [datetime]$LastPlayed
    [UInt16]$averageItemLevel
    [UInt16]$averageItemLevelEquipped
    [string]$FolderPath
    [string]$SettingsFolderPath
    [string]$AddOnsFilePath
    [string]$BindingsCachePath
    [string]$ConfigCachePath
    [string]$MacrosCachePath
    [double]$Gold
    [Currency[]]$Currency
    [AzeriteEssence[]]$AzeriteEssences
    [timespan]$PlayedLevel
    [timespan]$PlayedTotal
    [bool]$DailyCurrent
    [datetime]$DailyReset
    [bool]$BiWeeklyCurrent
    [datetime]$BiWeeklyReset
    [bool]$WeeklyCurrent
    [datetime]$WeeklyReset
    [bool]$isResting
    [UInt16]$ArtifactLevel
    [double]$ArtifactProgress
    [string]$Zone
    [UInt16]$CloakLevel
    [UInt16]$CorruptionResistance
    [bool]$Warmode
    [bool]$VisionUnlocked
    [bool]$Vision10
    [bool]$Vision30
    [bool]$Vision50
    [bool]$Vision51
    [bool]$Vision52
    [bool]$Vision53
    [bool]$Vision54
    [bool]$Vision55
    [bool]$VisionCompleted
    [string]$Vision
    [UInt16]$KeyBest
    [string]$KeyBagName
    [UInt16]$KeyBagLevel
    [UInt16]$WarTornWeeklyMax
    [UInt16]$WarTornEarnedThisWeek
    [UInt16]$WarTornweeklyAvailable
    [UInt16]$WarTornTotalMax
    [UInt16]$WarTornTotal
    [double]$RIOScore
    [double]$RIOScoreTank
    [double]$RIOScoreHealer
    [double]$RIOScoreDPS
    [string]$AssultUld
    [string]$AssultVale
    [string]$EmiLeg1
    [string]$EmiLeg2
    [string]$EmiLeg3
    [string]$EmiBFA1
    [string]$EmiBFA2
    [string]$EmiBFA3
    [bool]$HasNewMail
    [int]$Durability

    Character() {}

    [string]ToString() {
        return $this.Name + ' - ' + $this.Realm.Name
    }
}

class Currency {
    [UInt16]$ID
    [string]$Name
    [int]$Amount

    Currency() {}

    Currency(
        [UInt16]$ID,
        [string]$Name,
        [int]$Amount
    ) {
        $this.ID = $ID
        $this.Name = $Name
        $this.Amount = $Amount
    }

    [string]ToString() {
        return $this.Amount + 'x ' + $this.Name
    }
}

class PowerType {
    [UInt16]$ID
    [string]$Name

    PowerType() {}

    PowerType(
        [UInt16]$ID,
        [string]$Name
    ) {
        $this.ID = $ID
        $this.Name = $Name
    }

    [string]ToString() {
        return $this.Name
    }
}

class Race {
    [UInt16]$ID
    [string]$Name
    [Faction]$Faction
    [bool]$IsSelectable
    [bool]$IsAlliedRace

    Race() {}

    Race (
        [UInt16]$ID,
        [string]$Name,
        [Faction]$Faction,
        [bool]$IsSelectable,
        [bool]$IsAlliedRace
    ) {
        $this.ID = $ID
        $this.Name = $Name
        $this.Faction = $Faction
        $this.IsSelectable = $IsSelectable
        $this.IsAlliedRace = $IsAlliedRace
    }

    [string]ToString() {
        return $this.Name
    }
}

class Realm {
    [UInt16]$ID
    [string]$Name
    [string]$Region
    [string]$Category
    [string]$Locale
    [string]$Timezone
    [string]$Type
    [bool]$IsTournament
    [string]$Slug

    Realm() {}

    Realm (
        [UInt16]$ID,
        [string]$Name,
        [string]$Region,
        [string]$Category,
        [string]$Locale,
        [string]$Timezone,
        [string]$Type,
        [bool]$IsTournament,
        [string]$Slug
    ) {
        $this.ID = $ID
        $this.Name = $Name
        $this.Region = $Region
        $this.Category = $Category
        $this.Locale = $Locale
        $this.Timezone = $Timezone
        $this.Type = $Type
        $this.IsTournament = $IsTournament
        $this.Slug = $Slug
    }

    Realm (
        [string]$Name
    ) {
        $this.Name = $Name
    }

    [string]ToString() {
        return $this.Name
    }
}

class Specialization {
    [UInt16]$ID
    [string]$Name
    [string]$Description
    [PowerType]$PowerType
    [Role]$Role

    Specialization() {}

    Specialization(
        [UInt16]$ID,
        [string]$Name,
        [string]$Description,
        [Role]$Role
    ) {
        $this.ID = $ID
        $this.Name = $Name
        $this.Description = $Description
        $this.Role = $Role
    }

    [string]ToString() {
        return $this.Name
    }
}
