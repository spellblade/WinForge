name: Bug Report
description: Report something that is broken or behaving unexpectedly
title: "[Bug] "
labels: ["bug"]
assignees: []

body:
  - type: markdown
    attributes:
      value: |
        ## Bug Report

        Thank you for reporting a bug. Please fill out the sections below to help us reproduce and fix the issue.

  - type: textarea
    id: description
    attributes:
      label: Description
      description: A clear description of the bug. What happened vs what you expected?
      placeholder: |
        Short and specific description of the bug.

        Example: Running `Initialize-WFConfiguration` from WSL throws
        "VERSION file not found" even though the file exists at the project root.
    validations:
      required: true

  - type: textarea
    id: steps
    attributes:
      label: Steps to Reproduce
      description: List the exact steps to reproduce the bug, in order.
      placeholder: |
        1. Open PowerShell 7
        2. Navigate to project root
        3. Run `pwsh ./src/WinForge.ps1`
        4. See error
    validations:
      required: true

  - type: textarea
    id: expected
    attributes:
      label: Expected Behavior
      description: What should happen instead?
    validations:
      required: true

  - type: textarea
    id: actual
    attributes:
      label: Actual Behavior
      description: What actually happened?
    validations:
      required: true

  - type: dropdown
    id: version
    attributes:
      label: WinForge Version
      description: Which version of WinForge are you running?
      options:
        - 0.1.0
        - 0.2.0 (dev)
        - Latest from develop branch
        - Built from source
    validations:
      required: true

  - type: dropdown
    id: os
    attributes:
      label: Operating System
      options:
        - Windows 10
        - Windows 11
        - Windows Server 2022
        - Windows Server 2019
        - Other

  - type: dropdown
    id: pwsh
    attributes:
      label: PowerShell Version
      options:
        - PowerShell 7.x
        - PowerShell 5.1 (Windows PowerShell)
        - Other

  - type: textarea
    id: logs
    attributes:
      label: Log Output
      description: Paste relevant lines from the log file (logs/YYYY-MM-DD.log)
      placeholder: |
        [2026-08-05 14:23:01] [ERROR] ...
        at Initialize-WFConfiguration ...
      render: shell

  - type: textarea
    id: extra
    attributes:
      label: Additional Context
      description: Anything else that might help (screenshots, related issues, etc.)