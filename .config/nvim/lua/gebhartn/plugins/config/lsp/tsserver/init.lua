local lsp = require "lspconfig"

local M = {}

function M.setup(lsp_opts)
    lsp.tsserver.setup {
        init_options = {documentHighlight = false, publishDiagnostics = true},
        capabilities = lsp_opts.capabilities,
        commands = {
            OrganizeImports = {
                function()
                    local params = {
                        command = "_typescript.organizeImports",
                        arguments = {vim.api.nvim_buf_get_name(0)},
                        title = ""
                    }
                    vim.lsp.buf.execute_command(params)
                end,
                description = "Organize Imports"
            }
        },
        on_attach = function(client)
            if client.config.flags then
                client.config.flags.allow_incremental_sync = true
            end

            -- tsserver conflicts with locally installed linters
            client.resolved_capabilities.document_formatting = false
            lsp_opts.on_attach(client)
        end
    }
end

return M
