
function Write-WoWVerbose {
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
        [string]
        $Message
    )
    <#
    $CallStack = (Get-PSCallStack).Command | Select-Object -SkipLast 1
    if ($CallStack.count -gt 1)  {
        $CallStack = $CallStack | Select-Object -Skip 1
        $CallStack = $CallStack | Select-Object -Skip 1 | Select-Object -First 1
        [array]::Reverse($CallStack)
        $CallStack = $CallStack -join " > "
    }
    Write-Verbose "[$(Get-Date -Format $Script:WoW_DateFormat)]: $CallStack`: $Message"
    #>
    Write-Verbose "[$(Get-Date -Format $Script:WoW_DateFormat)]: $Message"
}
