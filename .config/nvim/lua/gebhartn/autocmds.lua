-- Trim hanging whitespace
vim.cmd [[au BufWritePre * %s/\s\+$//e]]

-- Start NERDTree when vim is started without file arguments
vim.cmd [[autocmd StdinReadPre * lua vim.s.std_in = 1]]
vim.cmd [[autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif]]

-- TSConfig is actually jsonc, stop whining about comments
vim.cmd [[autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc]]

vim.api.nvim_exec(
    [[
function Term() abort
    let bufNum = bufnr('term://')
    let termNum = bufwinnr('term://')
    if termNum > 0 && winnr('$') > 1
        execute termNum . 'wincmd c'
    elseif bufNum > 0 && bufNum != bufnr(@%)
        execute 'sb ' . bufNum . ' | wincmd p'
    elseif bufNum == bufnr(@%)
        execute 'bprevious | sb ' . bufNum . ' | wincmd p'
    else
        execute 'sp term://bash'
    endif
endfunction
command! -bang -nargs=* Term call Term()
]],
    false
)
