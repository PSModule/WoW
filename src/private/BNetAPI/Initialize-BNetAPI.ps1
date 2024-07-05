#Force the Invoke-RestMethod PowerShell cmdlet to use TLS 1.2
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls13

enum BNetAPIRegion {
    CN = 0
    US = 1
    EU = 2
    KR = 3
    TW = 4
}

$Script:BNetAPI_RegionSettings = @(
    @{
        APIURI       = 'https://gateway.battlenet.com.cn/'
        BNetAPIPath  = 'https://www.battlenet.com.cn/'
        LocaleList   = @('zh_CN')
        Locale       = 'zh_CN'
        Region       = 'cn'
        WoWNameSpace = @{
            Static  = 'static-cn'
            Dynamic = 'dynamic-cn'
            Profile = 'profile-cn'
        }
    }
    @{
        APIURI       = 'https://us.api.blizzard.com/'
        BNetAPIPath  = 'https://us.battle.net/'
        LocaleList   = @('en_US', 'es_MX', 'pt_BR')
        Locale       = 'en_US'
        Region       = 'us'
        WoWNameSpace = @{
            Static  = 'static-us'
            Dynamic = 'dynamic-us'
            Profile = 'profile-us'
        }
    }
    @{
        APIURI       = 'https://eu.api.blizzard.com/'
        BNetAPIPath  = 'https://eu.battle.net/'
        LocaleList   = @('en_GB', 'es_ES', 'fr_FR', 'ru_RU', 'de_DE', 'pt_PT', 'it_IT')
        Locale       = 'en_US'
        Region       = 'eu'
        WoWNameSpace = @{
            Static  = 'static-eu'
            Dynamic = 'dynamic-eu'
            Profile = 'profile-eu'
        }
    }
    @{
        APIURI       = 'https://kr.api.blizzard.com/'
        BNetAPIPath  = 'https://kr.battle.net/'
        LocaleList   = @('ko_KR')
        Locale       = @('ko_KR')
        Region       = 'kr'
        WoWNameSpace = @{
            Static  = 'static-kr'
            Dynamic = 'dynamic-kr'
            Profile = 'profile-kr'
        }
    }
    @{
        APIURI       = 'https://tw.api.blizzard.com/'
        BNetAPIPath  = 'https://tw.battle.net/'
        LocaleList   = @('zh_TW')
        Locale       = @('zh_TW')
        Region       = 'tw'
        WoWNameSpace = @{
            Static  = 'static-tw'
            Dynamic = 'dynamic-tw'
            Profile = 'profile-tw'
        }
    }
)

$Script:BNetAPI_ClientID = '<get from secret vault>'
$Script:BNetAPI_ClientSecret = '<get from secret vault>'
$Script:BNetAPI_Settings = $Script:BNetAPI_RegionSettings[2]
