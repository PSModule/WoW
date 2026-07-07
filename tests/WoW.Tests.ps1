#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '6.0.0'; MaximumVersion = '6.*'; GUID = 'a699dea5-2c73-4616-a270-1f7abb777e71' }

[CmdletBinding()]
param()

Describe 'WoW' {
    It 'Module is loaded' {
        Get-Module -Name WoW | Should -Not -Be $null
    }
}
