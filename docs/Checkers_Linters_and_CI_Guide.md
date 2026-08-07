# WinForge — Checkers, Linters & CI Guide

This guide consolidates the best practices for static analysis, local development tooling, GitHub Actions CI, and repository hygiene for WinForge. It is intended for Milestone 0.1 (`feature/init`) and later milestones.

---

## 1. Primary Linter: PSScriptAnalyzer

PSScriptAnalyzer is the official and only required static analysis tool for PowerShell in this project.

### Installation

```powershell
# Current user (no admin required)
Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force

# Verify
Get-Module -ListAvailable -Name PSScriptAnalyzer
```

---

## 2. Checkers & Linters Setup and Troubleshooting

This document records the exact steps performed to set up PSScriptAnalyzer, the related configuration files, and the troubleshooting that was required on a mixed WSL + Windows environment (PowerShell installed only on Windows).

---

## 3. File Placement Summary

These files were placed in the repository:

```
.github/
├── workflows/
│   └── ci.yml                          # Lint + smoke test workflow
├── PULL_REQUEST_TEMPLATE.md            # Compact version
├── CODEOWNERS
├── CONTRIBUTING.md
├── SECURITY.md
└── ISSUE_TEMPLATE/
    ├── bug-report.md
    └── feature-request.md
```

PSScriptAnalyzerSettings.psd1           # Project root – custom analyzer rules
.editorconfig                           # Project root

```
docs/
└── Checkers_Linters_and_CI_Guide.md    # Main reference guide
```

## 4. Initial Goal

Install and run PSScriptAnalyzer against the `src/` directory using the project settings file:

```powershell
Invoke-ScriptAnalyzer -Path ./src -Recurse -Settings ./PSScriptAnalyzerSettings.psd1
```

## 5. Step-by-Step Setup (What Was Actually Done)

### 5.1 Attempt on Windows PowerShell 5.1 (Failed)

```powershell
Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force
```

**Result:**

PowerShellGet required the NuGet provider. When it tried to install the provider, it failed with:

```
WARNING: Unable to download from URI 'https://go.microsoft.com/fwlink/?LinkID=627338&clcid=0x409' to ''.
WARNING: Unable to download the list of available providers. Check your internet connection.
PackageManagement\Install-PackageProvider : No match was found for the specified search criteria for the provider 'NuGet'.
```

### 5.2 Attempted Fixes on PowerShell 5.1 (Still Failed)

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser
```

The same download error persisted.

### 5.3 Working Solution – Switch to PowerShell 7

PowerShell 7 (`pwsh`) was used instead of Windows PowerShell 5.1.

```powershell
# Inside PowerShell 7
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force
```

**Result:** Installation succeeded.

**Why this worked**

PowerShell 7 ships with a modern PackageManagement / PowerShellGet stack and enables TLS 1.2+ by default. Windows PowerShell 5.1 uses an older, fragile bootstrap process that frequently fails when downloading the NuGet provider.

### 5.4 Module Loading Issue

After installation, running the analyzer produced:

```
Invoke-ScriptAnalyzer : The 'Invoke-ScriptAnalyzer' command was found in the module 'PSScriptAnalyzer',
but the module could not be loaded. For more information, run 'Import-Module PSScriptAnalyzer'.
```

**Fix applied:**

```powershell
# Set execution policy for the current process so the module could load
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Import-Module PSScriptAnalyzer -Force
```

### 5.5 Successful Analyzer Run

```powershell
Invoke-ScriptAnalyzer -Path ./src -Recurse -Settings ./PSScriptAnalyzerSettings.psd1
```

Expected clean result: no output (zero issues).

## 6. Troubleshooting Summary

| Problem | Cause | Solution that worked | Alternatives tried / available |
|---|---|---|---|
| NuGet provider download failed | Old PackageManagement in Windows PowerShell 5.1 + TLS issues | Switched to PowerShell 7 (`pwsh`) | Forced TLS 1.2 + Install-PackageProvider (failed). Manual DLL download was prepared as fallback but not needed. |
| `Install-Module` fails with “No match was found for the provider 'NuGet'” | Same as above | Use PowerShell 7 | Update PowerShellGet / PackageManagement on 5.1, or manual NuGet provider install |
| `Invoke-ScriptAnalyzer` command found but module cannot be loaded | Module installed but not imported in the current session + Execution Policy restriction | `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` then `Import-Module PSScriptAnalyzer -Force` | Restart the PowerShell session and import again |
| General recommendation | Windows PowerShell 5.1 is fragile for modern module installation | Always use PowerShell 7 for WinForge development | Keep 5.1 only if absolutely required |

## 7. Recommended Daily Commands (PowerShell 7)

```powershell
# Import (needed in new sessions if not auto-loaded)
Import-Module PSScriptAnalyzer -Force

# Run the project linter
Invoke-ScriptAnalyzer -Path ./src -Recurse -Settings ./PSScriptAnalyzerSettings.psd1

# Smoke-test the launcher
pwsh ./src/WinForge.ps1
```

## 8. Notes for Future Contributors

WinForge targets PowerShell 7.
Do all PowerShell work (installation, linting, testing) in `pwsh`.
Git and file editing can still be done from WSL.
The CI workflow (`.github/workflows/ci.yml`) runs on `windows-latest` and already includes both PSScriptAnalyzer and a launcher smoke test.

---

Last updated: 2026-08-08
