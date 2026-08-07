# ---------------------------------------------
# WinForge Launcher
# ---------------------------------------------

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Find project root
# $ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ScriptRoot = $PSScriptRoot

# Load Core modules
Import-Module "$ScriptRoot\Core\Config.psm1" -Force
# TODO(feature/logging): Import-Module "$ScriptRoot\Core\Logging.psm1" -Force
Import-Module "$ScriptRoot\Core\Console.psm1" -Force
# TODO(feature/utils): Import-Module "$ScriptRoot\Core\Utils.psm1" -Force

# Initialize application
Initialize-WFConfiguration
# TODO(feature/logging): Initialize-WFLogging 

# Show UI
Show-WFBanner
