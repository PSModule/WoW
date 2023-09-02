#Requires -Version 3.0
#Requires -Modules @{ ModuleName="Terminal-Icons"; ModuleVersion='0.11' }
#Requires -Modules @{ ModuleName="posh-git"; ModuleVersion='1.0' }
#Requires -PSEdition Core

Function Write-WoWWarning {
    [Cmdletbinding()]
    param(
        [Parameter(Mandatory)]
        [string]
        $Message
    )
    $CallStack = (Get-PSCallStack).Command | Select-Object -SkipLast 1
    if ($CallStack.count -gt 1)  {
        $CallStack = $CallStack | Select-Object -Skip 1
        [array]::Reverse($CallStack)
    }
    Write-Warning "[$(Get-Date -Format $Script:DateFormat)]: $CallStack`: $Message"
}
