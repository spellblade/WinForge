name: Feature Request
description: Suggest a new feature, module, or improvement
title: "[Feature] "
labels: ["enhancement"]
assignees: []

body:
  - type: markdown
    attributes:
      value: |
        ## Feature Request

        Have an idea for a new WinForge module or improvement? Tell us what it does, why it matters, and how it fits into the existing architecture.

  - type: textarea
    id: summary
    attributes:
      label: Feature Summary
      description: A short, one-sentence description of the feature
      placeholder: |
        Example: Add WSL VHD size analyzer and safe compaction tool
    validations:
      required: true

  - type: textarea
    id: problem
    attributes:
      label: Problem or Motivation
      description: What problem does this solve? Why would a user want this?
      placeholder: |
        WSL2 distributions grow over time and can consume 100+ GB of disk space
        with no built-in way to reclaim space. WinForge should detect this and
        help users safely compact VHD files.
    validations:
      required: true

  - type: dropdown
    id: module
    attributes:
      label: Module Category
      description: Which part of WinForge does this belong to?
      options:
        - Inventory (read-only data collection)
        - Analysis (evaluation and classification)
        - Cleanup (safe deletion)
        - Repair (system modification)
        - Reports (output generation)
        - Core (framework, config, logging)
        - New category (not yet defined)

  - type: textarea
    id: description
    attributes:
      label: Detailed Description
      description: How should this feature work? What functions would it expose?
      placeholder: |
        Proposed commands:
        - Get-WFWSLDistribution   → List all WSL distros with VHD sizes
        - Get-WFWSLVHDSize        → Show total VHD consumption per distro
        - Optimize-WFWSLVHD       → Compact selected VHD files
        - Remove-WFWSLDistribution → Uninstall a distro
    validations:
      required: true

  - type: textarea
    id: alternatives
    attributes:
      label: Alternatives Considered
      description: Are there other ways to solve this? Existing tools, manual steps?
    validations:
      required: false

  - type: dropdown
    id: milestone
    attributes:
      label: Target Milestone
      description: Which WinForge version should this be part of?
      options:
        - v0.2 - Storage Analyzer
        - v0.3 - Cleanup Engine
        - v0.4 - Repair Center
        - v0.5 - Developer Toolkit
        - v0.6 - WSL Tools
        - v0.7 - NVIDIA Toolkit
        - v0.8 - Duplicate Finder
        - v0.9 - AI/LLM Manager
        - v1.0 - GUI and Plugins
        - Undecided

  - type: checkboxes
    id: requirements
    attributes:
      label: Requirements
      options:
        - label: Read-only operation (no system modification)
          required: false
        - label: Must include confidence scoring
          required: false
        - label: Must support preview before action
          required: false
        - label: Must log all actions
          required: false
        - label: Must generate a report
          required: false

  - type: textarea
    id: extra
    attributes:
      label: Additional Context
      description: Mock output, screenshots, related issues, references, etc.