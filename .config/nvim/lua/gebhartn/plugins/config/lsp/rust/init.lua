local lsp = require "lspconfig"

local M = {}

function M.setup(lsp_opts)
    lsp.rust_analyzer.setup(
        {
            on_attach = function(client)
                lsp_opts.on_attach(client)
                client.resolved_capabilities.document_formatting = false

                -- Inline hints
                vim.cmd [[autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"}}]]
            end,
            capabilities = lsp_opts.capabilities,
            settings = {
                ["rust-analyzer"] = {
                    assist = {
                        importMergeBehavior = "last",
                        importPrefix = "by_self"
                    },
                    cargo = {
                        loadOutDirsFromCheck = true
                    },
                    procMacro = {
                        enable = true
                    }
                }
            }
        }
    )
end

return M
