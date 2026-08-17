# ==========================================
# WinForge Configuration Module
# ==========================================

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

<#
.SYNOPSIS
    WinForge Configuration module.
.DESCRIPTION
    Creates and manages the runtime configuration object used
    by all other WinForge modules. This is the single source of 
    project paths and settings—nothing is hardcoded
    anywhere else in the codebase.
#>

function Initialize-WFConfiguration {
    # Auto-detect project root from this module's path
    # Config.psm1 lives in src/Core/ — two levels up is project root
    # $ModuleDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $ModuleDir = $PSScriptRoot
    $ProjectRoot = Split-Path -Parent (Split-Path -Parent $ModuleDir)
    # Read version from VERSION file
    $VersionFile = Join-Path $ProjectRoot "VERSION"
    if (-not (Test-Path $VersionFile)) {
        throw "VERSION file not found: $VersionFile"
    }
    $Version = (Get-Content $VersionFile -Raw).Trim()
    $ApplicationName = "WinForge"
    $script:WF = [PSCustomObject]@{
        Name       = $ApplicationName
        Version    = $Version

        Root       = $ProjectRoot
        ConfigPath = Join-Path -Path $ProjectRoot -ChildPath 'config'
        LogPath    = Join-Path -Path $ProjectRoot -ChildPath 'logs'
        ReportPath = Join-Path -Path $ProjectRoot -ChildPath 'reports'

        StartTime  = Get-Date

    }

    # Ensure required folders exist
    @(
        $script:WF.ConfigPath,
        $script:WF.LogPath,
        $script:WF.ReportPath
    ) | ForEach-Object {
        if (-not (Test-Path -Path $_)) {
            New-Item -Path $_ -ItemType Directory -Force | Out-Null
        }
    }

    return $script:WF
}

<#
.SYNOPSIS
    Initializes the WinForge configuration object.
.DESCRIPTION
    Creates the $script:WF configuration object from this module's
    location (src/Core/ -> two levels up to project root). Ensures
    required directories exist on disk.
.OUTPUTS
    PSCustomObject
#>

function Get-WFConfiguration {
    return $script:WF
}

Export-ModuleMember -Function 'Initialize-WFConfiguration', 'Get-WFConfiguration'
