#Requires -Version 7.0

Function Write-WoWWarning {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Message
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [Cmdletbinding()]
    param(
        [Parameter(Mandatory)]
        [string]
        $Message
    )
    $CallStack = (Get-PSCallStack).Command | Select-Object -SkipLast 1
    if ($CallStack.count -gt 1) {
        $CallStack = $CallStack | Select-Object -Skip 1
        [array]::Reverse($CallStack)
    }
    Write-Warning "[$(Get-Date -Format $Script:DateFormat)]: $CallStack`: $Message"
}
