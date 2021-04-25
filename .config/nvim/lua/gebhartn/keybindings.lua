local utils = require "gebhartn.utils"

vim.g.mapleader = " "

-- Unbind default bindings for arrow keys
utils.vnoremap("<up>", "<nop>")
utils.vnoremap("<down>", "<nop>")
utils.vnoremap("<left>", "<nop>")
utils.vnoremap("<right>", "<nop>")

utils.inoremap("<up>", "<nop>")
utils.inoremap("<down>", "<nop>")
utils.inoremap("<left>", "<nop>")
utils.inoremap("<right>", "<nop>")

-- Enter normal mode
utils.inoremap("jk", "<ESC>")

-- Map escape from terminal input to Normal mode
utils.tnoremap("<ESC>", [[<C-\><C-n>]])
utils.tnoremap("jk", [[<C-\><C-n>]])

-- Hide highlights
utils.nnoremap("<leader><CR>", ":noh<CR>")

-- Reload file
utils.nnoremap("<leader>r", ":e!<CR>")

-- Reload config
utils.nnoremap("<leader>vs", "<cmd>ConfigReload<CR>")

-- LSP
utils.nnoremaps("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
utils.nnoremaps("gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
utils.nnoremaps("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
utils.nnoremaps("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
utils.nnoremaps("qf", "<cmd>lua vim.lsp.buf.code_action()<CR>")
utils.nnoremaps("<leader>ll", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
utils.nnoremaps("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
utils.nnoremaps("<leader>j", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
utils.nnoremaps("<leader>k", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")

-- Fuzzyfinding
utils.nnoremap("<C-p>", [[<cmd>lua require'gebhartn.plugins.config.telescope'.git_files()<CR>]])
utils.nnoremap("<C-f>", [[<cmd>lua require'gebhartn.plugins.config.telescope'.find_files()<CR>]])
utils.nnoremap("<C-g>", [[<cmd>lua require'gebhartn.plugins.config.telescope'.live_grep()<CR>]])

-- Completion
utils.iexnoremap("<Enter>", "v:lua.smart_enter()")
utils.iexnoremap("<Tab>", "v:lua.smart_tab()")

-- NERDTree
utils.map("", "<C-n>", ":NERDTreeToggle<CR>", {})

-- Create a new file adjacent to current buffer
utils.nnoremap("<leader>n", ':e <C-R>=expand("%:p:h") . "/" <CR>')

-- Ends my suffering
utils.nnoremap("q:", ":q")

-- Tabs
-- utils.nnoremap("<C-t>", ":tabnew<CR>")
-- utils.nnoremap("<leader>t", ":call g:tabulous#renameTab()<CR>")

-- Organize TS imports
utils.nnoremap("<C-i>", ":OrganizeImports<CR>")

-- Call scuffed terminal toggle
utils.nnoremap("<C-t>", ":Term<CR>")
