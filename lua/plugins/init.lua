
return {
    require("plugins.sonokai"),
    require("plugins.cmp"),
    require("plugins.lsp"),
    require("plugins.quarto"),
    { "vim-airline/vim-airline" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "python", "markdown", "markdown_inline" },
            highlight = { enable = true },
        },
    },
}
