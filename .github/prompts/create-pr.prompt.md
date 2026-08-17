---
title: Generate PR Description
description: Generates a PR description based on the workspace PR template and the changes in the current branch.
---

# Task
Analyze the changes in the current branch compared to the base branch (`develop`).
Read the PR template at `.github/PULL_REQUEST_TEMPLATE.md`.
Populate the template with details from the changes.

# Context
- Base Branch: `develop`
- Current Branch: `feature/logger`
- Template: `.github/PULL_REQUEST_TEMPLATE.md`

# Guidelines
- Be concise but descriptive in the Summary.
- List all modified files and a brief note on what changed in each.
- Include testing instructions (e.g., how to run the script).
- Check the checklist items based on the code analysis (e.g., if help comments are present).
