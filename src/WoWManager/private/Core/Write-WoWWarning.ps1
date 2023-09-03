#Requires -Version 7.0
#Requires -PSEdition Core
#Requires -Modules PATH, Fonts

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
