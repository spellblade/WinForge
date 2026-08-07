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