Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

<#
.SYNOPSIS
    WinForge Console module.
.DESCRIPTION
    Handles all screen output. No other module writes directly to
    the console—business modules return objects and this module
    handles rendering. Follows the principle that Write-Host
    belongs exclusively here.
#>

<#
.SYNOPSIS
    Displays the WinForge banner.
.DESCRIPTION
    Prints the WinForge name, tagline, and version in a formatted
    block. Reads directly from the $script:WF configuration object.
#>

function Show-WFBanner {
    $WF = Get-WFConfiguration
    $name    = $WF.Name
    $version = $WF.Version

    Write-Host '=========================================' -ForegroundColor Cyan
    Write-Host "             $name"                         -ForegroundColor Cyan
    Write-Host ' Windows Maintenance & Diagnostics Toolkit' -ForegroundColor Cyan
    Write-Host "             v$version"                     -ForegroundColor Cyan
    Write-Host '=========================================' -ForegroundColor Cyan
}

Export-ModuleMember -Function 'Show-WFBanner'
