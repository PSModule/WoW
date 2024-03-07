Function Find-WoWFolder {
    <#
    .SYNOPSIS
    Find WoW (retail) folder

    .DESCRIPTION
    Finds WoW (retail) folder, by first checking for the default location, then looking for all folders with a WoW.exe file.
    User is prompted for possible location where WoW.exe is found.

    .EXAMPLE
    Get-WoWFolder

    #>
    [Cmdletbinding()]
    [OutputType([System.IO.DirectoryInfo])]
    param(
        $Path = 'C:\Program Files (x86)\World of Warcraft\_retail_'
    )
    $DefaultPath = 'C:\Program Files (x86)\World of Warcraft\_retail_'

    Write-WoWVerbose 'Looking for WoW folders'
    if (Test-Path -Path $Path) {
        Write-WoWVerbose "Found $Path"
        Write-WoWVerbose "Looking for WoW.exe in $Path"
        $WoWFile = Get-ChildItem -Path $Path -Filter Wow.exe -File -Recurse -ErrorAction SilentlyContinue
        if ($WoWFile) {
            Write-WoWVerbose "Found WoW.exe in $($WoWFile.Directory)"
            return $WoWFile.Directory
        }
    } elseif (Test-Path -Path $DefaultPath) {
        Write-WoWVerbose "Found $DefaultPath"
        Write-WoWVerbose "Looking for WoW.exe in $DefaultPath"
        $WoWFile = Get-ChildItem -Path $DefaultPath -Filter Wow.exe -File -Recurse -ErrorAction SilentlyContinue
        if ($WoWFile) {
            Write-WoWVerbose "Found WoW.exe in $($WoWFile.Directory)"
            return $WoWFile.Directory
        }
    } else {
        $Disks = Get-Volume | Where-Object { ($null -ne $_.DriveLetter) -and ($_.DriveType -eq 'Fixed') } |
            Select-Object -ExpandProperty DriveLetter | ForEach-Object { Get-Item -Path "$_`:\" }
        $WoWFolders = $Disks | Get-ChildItem -Recurse -ErrorAction SilentlyContinue -Include 'wow.exe' |
            Select-Object -ExpandProperty DirectoryName

        if ($WoWFolders.count -gt 1) {
            Write-WoWVerbose 'Multiple instances of WoW detected:'
            $i = 0
            # $WoWFolder = $WoWFolders[0]
            foreach ($WoWFolder in $WoWFolders) {
                Write-WoWVerbose "$i - $WoWFolder"
                $i++
            }
            $Selection = Read-Host -Prompt 'Select WoW instance: '
        } else {
            return $WoWFolders
        }
        return $WoWFolders[$Selection]
    }
}
