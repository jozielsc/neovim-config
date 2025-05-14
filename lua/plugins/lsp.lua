return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "ruff_lsp", "pyright" }, -- Use "ruff_lsp" para o novo LSP do Ruff
    })

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities()
    )

    -- Configuração do Pyright
    lspconfig.pyright.setup({
      capabilities = capabilities,
      settings = {
        pyright = {
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            ignore = { "*" }, -- Deixe Ruff fazer o lint
          },
        },
      },
    })

    -- Configuração do Ruff LSP
    lspconfig.ruff_lsp.setup({
      capabilities = capabilities,
    })
  end,
}

