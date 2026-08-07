# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |
| < 0.1   | :x:                |

Only the latest minor version in the 0.x range receives security updates.

## Reporting a Vulnerability

If you discover a security vulnerability in WinForge, **do not open a public GitHub issue**. Instead, please report it privately to allow time for a fix before public disclosure.

### How to Report

1. **Email** the maintainer directly with:
   - A description of the vulnerability
   - Steps to reproduce it
   - Any potential impact
   - (Optional) Suggested fix or mitigation

2. **Expected response time**: Within 48 hours for an acknowledgment. Within 7 days for an initial assessment and projected timeline for a fix.

3. **Coordinated disclosure**: We follow responsible disclosure. Please give reasonable time (typically 30 days) before public disclosure of the vulnerability.

## Security Design Notes

WinForge is designed with the following security principles:

- **No remote downloads**: WinForge never downloads code from the internet at runtime
- **No privilege escalation without consent**: Repair modules require explicit admin elevation with user confirmation
- **No deletion without confirmation**: Every destructive action requires user confirmation and is logged
- **Quarantine mode**: Sensitive deletions can be moved to a quarantine folder instead of permanent removal
- **No credentials stored**: WinForge never stores passwords, tokens, or API keys
- **Read-only by default**: Inventory and analysis modules make no system changes

## What to Include in a Report

- WinForge version and commit hash (if built from source)
- PowerShell version (`$PSVersionTable.PSVersion`)
- Windows version and build (`winver`)
- Steps to reproduce
- Expected vs actual behavior
- Any log output showing the vulnerability

Thank you for helping keep WinForge secure.