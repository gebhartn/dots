local current_path = (...):gsub("%.init$", "")
local lsp_status = require "lsp-status"

local completion = require "completion"

-- Shared on_attach configuration
local on_attach = function(client)
    completion.on_attach(client)

    if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
        vim.cmd [[augroup END]]
    end

    vim.cmd [[augroup HoverDiagnostics']]
    vim.cmd [[au!]]
    vim.cmd [[au CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()]]
    vim.cmd [[augroup END]]
end

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {signs = true, virtual_text = false, update_in_insert = true, underline = true}
)

-- Formatting
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command("noautocmd :update")
        end
    end
end

-- Typescript
require(current_path .. ".tsserver").setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}

-- Rust
require(current_path .. ".rust").setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}

-- Golang
require(current_path .. ".go").setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}

-- GraphQL
require(current_path .. ".graphql").setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}

-- HTML
require(current_path .. ".html").setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}

-- Lua
require(current_path .. ".sumneko_lua").setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}

-- JSON
require(current_path .. ".json").setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}

-- Linting
require(current_path .. ".efm").setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
