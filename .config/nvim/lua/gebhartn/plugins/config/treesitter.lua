require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "bash",
        "css",
        "go",
        "graphql",
        "html",
        -- "javascript",
        "json",
        "lua",
        "rust",
        -- "tsx",
        "typescript",
        "svelte"
    },
    highlight = {enable = true}
}
