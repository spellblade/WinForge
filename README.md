# WinForge

Windows Maintenance & Diagnostics Toolkit written in PowerShell.

WinForge aims to provide a modular toolkit for inspecting, diagnosing, maintaining, and repairing Windows systems without relying on multiple third-party utilities.

---

## Current Status

**Version:** 0.1.0

🚧 Early development

The project is currently focused on building the core framework before implementing diagnostic and repair modules.

---

## Goals

- Modular architecture
- Object-oriented PowerShell design
- Safe-by-default operations
- Comprehensive logging
- Report generation
- Windows 10 & Windows 11 support
- Developer-friendly codebase

---

## Project Structure

```
WinForge
│
├── src/
│   ├── Core/
│   ├── Inventory/
│   ├── Analysis/
│   ├── Repair/
│   ├── Reports/
│   └── Private/
│
├── config/
├── docs/
├── logs/
├── reports/
├── scripts/
├── tests/
└── assets/
```

---

## Current Progress

### Completed

- Repository initialization
- Project folder structure
- Core launcher
- Configuration module
- Console module
- Runtime configuration object
- Automatic project root detection
- Automatic folder creation

### In Progress

- Logging module
- Utilities
- Error handling
- Progress reporting
- Settings management

### Planned

- System Inventory
- WindowsApps Analysis
- Package Inventory
- NVIDIA Diagnostics
- WinRE Tools
- Windows Update Repair
- Developer Cache Cleanup
- Report Engine

---

## Development Workflow

```
feature/*
      │
      ▼
develop
      │
      ▼
staging
      │
      ▼
master
```

All new work is developed in feature branches, merged into `develop`, and finally released through `master`.

---

## License

MIT License