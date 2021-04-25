## Disclaimer

As is the case with all nightly release channels, there are sometimes bugs with the the language server implementations and/or the underlying apis that are relied upon by the LSP. Luckily for us, all of these tools are active, open sourced, and the maintainers are excited to build new things for the vim community, so get after it!

## General

This is _highly_ opinionated as the built in LSP requires quite a bit of integration with both your options and keybindings to imitate the out-of-the-box experience you'd get using something like [CoC][coc] or [YCM][ycm].

Despite what seems like a lot of configuration, I'd consider this to be a pretty minimalist working environment for software development. There is no _bespoke_ compiler integration, no git integration, no testing suite, no debugger, and no diff tool (aside from the native vim diff, :make, etc.). These things (particularly testing/debugging/diffing) might be implemented at a later date. You can almost think of this as sane defaults for what could eventually become a full IDE experience

A list of installed language servers and their associated configurations are required in the lsp/ directory, along with some formatting/linting configurations for the associated filetypes.

In addition to the globally installed language servers you will need to install several binaries to execute format actions on a given filetype.

## I copy/pasted - now what?

`jk` will bring you from [insert or terminal] mode to normal mode
`ctrl-p` will open up git files for buffer navigation
`ctrl-g` will prompt you for ripgrep
`ctrl-n` will open nerdtree for traditional filetree navigation (not recommended)
`ysiw` will prompt you to wrap a word in quotes, tags, brackets, etc.
`supported file types` will auto-format on save
`supported file types` have asynchronous linting
`supported file types` have code completion (use tab to cycle, enter to select)
`gd` to go to definition under cursor
`gi` to go to implementation
`qf` to apply a quickfix code action on the line under your cursor
`<space>rn` to rename the symbol under your cursor
`<space>n` will prompt you to create a new file adjacent to your current buffer
`ctrl-t` to open a new tab (I recommend this for terminals, compiling, etc -- prefer buffers for file navigation)

If you are encountering any bugs, use `:checkhealth` to make sure you've properly installed treesitter parses and the language servers required are installed & executable, similarly you can check attached servers with `:LspInfo`.

#### Why isn't support for x language installed?

I don't like python, man

## Plugins

All of my plugins are managed by the native neovim package manager, and aside from the plugins that have explicit configuration files, the additional plugins I am using are not immediately obvious.

At the time of writing, I am using the following:

-   completion-nvim [code completion]
-   telescope.nvim (plenary and popup are dependencies) [fuzzyfinder]
-   lsp-status.nvim [status line integration]
-   nvim-lspconfig [lsp core configurations]
-   nvim-treesitter [syntax highlighting]
-   vim-commentary [filetype specific commenting rules]
-   vim-surround [wrap things in quotes, tags, etc.]
-   vim-noctu [colorscheme inherited from terminal colors]
-   tabulous [aesthetic tabline for my terminals]
-   nerdtree lol

### How to manage plugins this way

You can read more about this with `:h packages`

I use some bash scripts to manage my plugins, define a \$PLUG variable in your shrc and use git submodules to manage the installation and updates of various plugins. These can be found in the [bin][binaries] directory.

An example \$PLUG variable:

in your ~/.[bash/zsh/sh]rc:

```bash
export PLUG='~/.local/share/nvim/site/pack/'
```

You'll have to initialize a git repository in the \$PLUG directory before these scripts will work.

[coc]: https://github.com/neoclide/coc.nvim
[ycm]: https://github.com/ycm-core/YouCompleteMe
[binaries]: ./bin
