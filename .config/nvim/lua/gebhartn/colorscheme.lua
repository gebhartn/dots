local utils = require "gebhartn.utils"

-- General colors
vim.cmd "syntax on"
vim.cmd "colorscheme noctu"

local lspd = "LspDiagnostics"

-- Diagnostic floating colors
utils.highlight(lspd .. "FloatingError", "7", "1")
utils.highlight(lspd .. "FloatingHint", "11")
utils.highlight(lspd .. "FloatingWarning", "11")

-- Diagnostic underline colors
utils.highlight(lspd .. "UnderlineError", "1")
utils.highlight(lspd .. "UnderlineHint", "11")
utils.highlight(lspd .. "UnderlineWarning", "11")

-- Diagnostic virtual colors
utils.highlight(lspd .. "VirtualTextError", "1")
utils.highlight(lspd .. "VirtualTextHint", "11")
utils.highlight(lspd .. "VirtualTextWarning", "11")

-- Weird underline hack for the tsserver diagnostics & eslint inconsistency
utils.highlight(lspd .. "UnderlineError", "1", "0")
utils.highlight(lspd .. "UnderlineHint", "11", "0")
utils.highlight(lspd .. "UnderlineWarning", "11", "0")

local function set_sign(type, icon)
    local sign = string.format("LspDiagnosticsSign%s", type)
    local texthl = string.format("LspDiagnosticsDefault%s", type)
    vim.fn.sign_define(sign, {text = icon, texthl = texthl})
end

set_sign("Error", "E")
set_sign("Hint", "O")
set_sign("Warning", "W")
