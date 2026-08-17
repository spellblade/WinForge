Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

<#
.SYNOPSIS
    WinForge Logging module.
.DESCRIPTION
    Provides log file initialization and timestamped message writing.
    All modules use Write-WFLog for diagnostic output. The log file
    path is derived from the configuration via Get-WFConfiguration.
#>

$script:LogFilePath = $null

<#
.SYNOPSIS
    Initializes the WinForge logging system.
.DESCRIPTION
    Creates today's log file under the configured LogPath and writes
    the initialization header. Reads configuration via Get-WFConfiguration.
#>

function Initialize-WFLogging {
    $WF = Get-WFConfiguration
    $date = Get-Date -Format 'yyyy-MM-dd'
    $script:LogFilePath = Join-Path -Path $WF.LogPath -ChildPath "$date.log"

    if (-not (Test-Path -Path $script:LogFilePath)) {
        $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
        "[$timestamp] [INFO] === WinForge log initialized ===" |
            Out-File -FilePath $script:LogFilePath -Encoding utf8
    }
}

<#
.SYNOPSIS
    Writes a message to the WinForge log file.
.DESCRIPTION
    Appends a timestamped entry at the specified level to today's log.
    Does not write to the console—use the Console module for screen output.
.PARAMETER Level
    Log level: INFO, WARN, ERROR, DEBUG.
.PARAMETER Message
    The message text to log.
#>

function Write-WFLog {
    param (
        [Parameter(Mandatory)]
        [ValidateSet('INFO', 'WARN', 'ERROR', 'DEBUG')]
        [string]$Level,

        [Parameter(Mandatory)]
        [string]$Message
    )

    if ($null -eq $script:LogFilePath) {
        throw 'WinForge logging has not been initialized.'
    }

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

    "[$timestamp] [$Level] $Message" |
        Out-File -FilePath $script:LogFilePath -Append -Encoding utf8
}

function Get-WFLogFile {
    return $script:LogFilePath
}

Export-ModuleMember -Function @(
    'Initialize-WFLogging'
    'Write-WFLog'
    'Get-WFLogFile'
)
