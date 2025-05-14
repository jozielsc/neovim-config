return {
    -- Tema Sonokai
    {
        "sainnhe/sonokai",
        priority = 1000,
        lazy = false,
        config = function()
            vim.g.sonokai_style = "andromeda"
            vim.g.sonokai_enable_italic = 1
            vim.g.sonokai_enable_italic_comment = 1
            vim.g.sonokai_diagnostic_line_highlight = 1
            vim.g.sonokai_better_performance = 1
            vim.g["airline#extensions#tabline#enable"] = 1
            vim.g["airline#extensions#formatter"] = "unique_tail"
            vim.g.airline_theme = "sonokai"
            vim.g.airline_powerline_fonts = 1
            vim.cmd.colorscheme("sonokai")
        end
    },
    -- COC (para autocompletar)
   -- {"neoclide/coc.nvim", branch = "release"},
    -- Treesitter para realce de sintaxe
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "lua",
                "python",
                "markdown",
                "markdown_inline"
            },
            highlight = { enable = true },
        },
    },
    -- Airline para barra de status
    {"vim-airline/vim-airline"},
    -- Nvim CMP para completions
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({select = true}),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                },
                sources = cmp.config.sources({
                    {name = "nvim_lsp"},
                    {name = "luasnip"},
                }, {
                    {name = "buffer"},
                    {name = "path"},
                }),
            })

          --  cmp.setup.cmdline(":", {
            --    sources = cmp.config.sources({ {name = "path"} }, {{ name = "cmdline"}} ),
           -- })
        end,
    },
    -- Quarto plugin para Neovim
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp",
            "neovim/nvim-lspconfig",
        },
    },
    -- LSP Config (pyright)
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- Configurações das capacidades do LSP
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_nvim_lsp.default_capabilities()
            )

            -- Configuração do Pyright
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
        end,
    },
}

