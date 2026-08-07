# Contributing to WinForge

Thank you for your interest in contributing to WinForge.

## Getting Started

1. **Fork** this repository on GitHub
2. **Clone** your fork locally: `git clone https://github.com/YOUR-USERNAME/WinForge.git`
3. **Create a branch** for your work: `git checkout -b feature/your-feature develop`

## Development Workflow

### Branch Model

We follow **Git Flow** with a simplified branch structure:

main         ← Production, tagged releases only
develop      ← Integration branch for the next release
staging      ← Pre-release validation
feature/*    ← New work, branched from develop, merged back via PR
release/*    ← Stabilization, branched from develop
hotfix/*     ← Urgent fixes, branched from main

### Commit Style

Keep commits small and meaningful. Format:

type(scope): short description

Optional longer explanation here if needed.

**Types:** `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

**Examples:**
- `feat(core): add Get-WFConfiguration accessor`
- `fix(inventory): resolve CPU detection on ARM64`
- `docs(readme): update installation instructions`

### Pull Request Process

1. **Open a PR** against `develop` (not `main` directly)
2. **Fill out the PR template** — summary, changes table, checklist
3. **Link the issue** — reference the GitHub issue (e.g., "Fixes #12")
4. **Pass CI** — PSScriptAnalyzer must report no errors
5. **Be responsive** — reviewers may request changes; address them promptly

### What Makes a Good PR

- One logical piece of work per PR (one feature, one fix)
- Includes tests for new functionality
- Updates CHANGELOG.md under `[Unreleased]`
- Does not include unrelated changes
- Passes all existing tests

## Coding Standards

All code must follow the WinForge coding standards:

- **Naming**: All public functions use `WF` prefix (e.g., `Get-WFSystemInfo`)
- **Strict mode**: `Set-StrictMode -Version Latest; $ErrorActionPreference = 'Stop'` in every file
- **Comment-based help**: Every public function has `.SYNOPSIS`, `.DESCRIPTION`, `.PARAMETER`, `.OUTPUTS`
- **No Write-Host**: Screen output only in `src/Core/Console.psm1`
- **No hardcoded paths**: Use `Get-WFConfiguration` to access `$WF.Root`, `$WF.LogPath`, etc.
- **No `$global:`**: Use `$script:` within modules; access via exported functions
- **One function per file**: Where practical, one public function per `.psm1` file
- **Objects, not text**: Business modules return `[PSCustomObject]`, never formatted strings

See `CodingStandards.txt` in the repo root for the full reference.

## Running the Checks

Before submitting a PR, run PSScriptAnalyzer locally:

# Install (one-time)
Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force

# Run analysis
Invoke-ScriptAnalyzer -Path "./src" -Recurse

# With custom config (from repo root)
Invoke-ScriptAnalyzer -Path "./src" -Recurse -Settings ".psscriptanalyzer.psd1"

No errors should be reported.

## Testing

- **Unit tests** run in WSL and Windows — no Windows API calls
- **Integration tests** run on Windows only — touch real system APIs
- **Destructive tests** require explicit opt-in tagging

See `TestingStrategy.txt` for details.

## Reporting Issues

- Use the **Bug Report** template for broken behavior
- Use the **Feature Request** template for new ideas
- Search existing issues before opening a new one
- Include your WinForge version, PowerShell version, and Windows version
- Attach relevant log output from `logs/YYYY-MM-DD.log`

## Questions?

Open a **Discussion** on GitHub if you're not sure whether something belongs in WinForge, or if you need guidance on implementation.