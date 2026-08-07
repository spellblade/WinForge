## Summary


## Feature


## Changes

| File | What changed |
|---|---|
| `src/...` | |

## How to test

pwsh ./src/WinForge.ps1



## Checklist

- [ ] PSScriptAnalyzer: zero errors and warnings (`Invoke-ScriptAnalyzer -Path ./src -Recurse`)
- [ ] All public functions have comment-based help
- [ ] Strict mode and `$ErrorActionPreference = 'Stop'` present in every `.ps1`/`.psm1`
- [ ] No `Write-Host` outside `Console.psm1`
- [ ] `Set-StrictMode -Version Latest` at top of every file
- [ ] Branch is up to date with `develop`