return {
    lintCommand = "eslint_d -f unix --stdin",
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatStdin = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin",
    lintStdin = true
}
