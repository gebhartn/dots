local M = {}

local function map(type, input, output, options)
    vim.api.nvim_set_keymap(type, input, output, options)
end

local function noremap(type, input, output)
    vim.api.nvim_set_keymap(type, input, output, {noremap = true})
end

local function snoremap(type, input, output)
    vim.api.nvim_set_keymap(type, input, output, {silent = true})
end

M.map = map

function M.nnoremap(input, output)
    noremap("n", input, output)
end

function M.inoremap(input, output)
    noremap("i", input, output)
end

function M.vnoremap(input, output)
    noremap("v", input, output)
end

function M.tnoremap(input, output)
    noremap("t", input, output)
end

function M.nnoremaps(input, output)
    snoremap("n", input, output)
end

function M.inoremaps(input, output)
    snoremap("i", input, output)
end

function M.vnoremaps(input, output)
    snoremap("v", input, output)
end

function M.tnoremaps(input, output)
    snoremap("t", input, output)
end

function M.nmap(input, output)
    map("n", input, output)
end

function M.imap(input, output)
    map("i", input, output)
end

function M.vmap(input, output)
    map("v", input, output)
end

function M.tmap(input, output)
    map("t", input, output)
end

function M.iexnoremap(input, output)
    map("i", input, output, {expr = true, noremap = true})
end

function M.reload_config()
    vim.cmd "luafile $MYVIMRC"
end

function M.toggle_conceal()
    if vim.wo.conceallevel == 2 then
        vim.wo.conceallevel = 0
    else
        vim.wo.conceallevel = 2
    end
end

function M.tt(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.highlight(key, fg, bg)
    if (bg == nil) then
        return vim.cmd(string.format("highlight %s ctermfg=%s", key, fg))
    else
        return vim.cmd(string.format("highlight %s ctermfg=%s ctermbg=%s", key, fg, bg))
    end
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and M.tt "<C-n>" or M.tt "<Tab>"
end

function _G.smart_enter()
    return vim.fn.pumvisible() == 1 and M.tt "<C-y>" or M.tt "<CR>"
end

function _G.formatting()
    vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
end

return M
