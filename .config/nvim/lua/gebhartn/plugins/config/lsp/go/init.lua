local lsp = require "lspconfig"

local M = {}

function M.setup(lsp_opts)
    lsp.gopls.setup {
        capabilities = lsp_opts.capabilities,
        on_attach = function(client)
            lsp_opts.on_attach(client)
            vim.wo.list = false

            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_highlighting = false
        end,
        cmd = {"gopls", "serve"},
        settings = {
            gopls = {
                analyses = {
                    unusedparams = false
                },
                staticcheck = true
            }
        }
    }
end

return M
