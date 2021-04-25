return {
    formatCommand = "rustfmt --edition 2018",
    formatStdin = true,
    lintCommand = "cargo clippy",
    lintFormats = {"%f:%l:%c: %m"}
}
