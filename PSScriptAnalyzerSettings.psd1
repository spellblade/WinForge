@{
    Severity = @('Error', 'Warning')

    ExcludeRules = @(
        # Only Console.psm1 is allowed to use Write-Host.
        # The linter cannot enforce the "only in Console.psm1" rule, so we exclude it
        # and enforce the rule via PR checklist + code review.
        'PSAvoidUsingWriteHost'

        # Not relevant while all functions are read-only (Initialize / Get / Show).
        # Re-enable when Repair- and Remove- functions are introduced.
        'PSUseShouldProcessForStateChangingFunctions'

        # WinForge intentionally uses the WF-prefixed verb pattern and returns
        # [PSCustomObject] rather than declared output types.
        'PSUseApprovedVerbs'
        'PSUseOutputTypeCorrectly'

        # Long lines are acceptable in comments and here-strings.
        'PSLineLength'
    )

    Rules = @{
        PSUseApprovedVerbs = @{
            ApprovedVerbs = @('Initialize')
        }
        PSProvideCommentHelp = @{
            Enable = $true
            ExportedOnly = $true
        }
        PSUseConsistentIndentation = @{
            Enable = $true
            IndentationSize = 4
        }
    }
}