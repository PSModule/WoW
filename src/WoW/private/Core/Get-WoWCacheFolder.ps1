Function Get-WoWCacheFolder {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER FolderPath
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [Cmdletbinding()]
    param(
        [string]
        [Parameter(Mandatory)]
        $FolderPath
    )
    if (Test-Path $FolderPath) {
        Write-WoWVerbose 'Folder exists, returning the object'
        $FolderObj = Get-Item -Path $FolderPath
    } else {
        Write-WoWVerbose "Folder doen't exists, creating folder"
        $FolderObj = New-Item -Path $FolderPath -ItemType Directory -Force
        Write-WoWVerbose 'Folder created'
    }
    return $FolderObj
}
