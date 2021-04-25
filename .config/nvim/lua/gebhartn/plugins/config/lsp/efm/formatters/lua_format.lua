return {
    lintCommand = "luacheck -g -",
    lintIgnoreExitCode = true,
    formatCommand = "luafmt ${-i:tabWidth} --stdin",
    formatStdin = true
}
