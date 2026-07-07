#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '6.0.0'; MaximumVersion = '6.*' }

[CmdletBinding()]
param()

Describe 'WoW' {
    It 'Module is loaded' {
        Get-Module -Name WoW | Should -Not -Be $null
    }
}
