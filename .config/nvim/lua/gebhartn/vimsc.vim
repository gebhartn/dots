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
nmap <leader><space> :Term<CR>

autocmd BufEnter * if !empty(matchstr(@%, "term",0)) | tnoremap <buffer> <Esc> <C-\><C-n> | endif
