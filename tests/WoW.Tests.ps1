[CmdletBinding()]
param()

Describe 'WoW' {
    It 'Module is loaded' {
        Get-Module -Name WoW | Should -Not -Be $null
    }
}
