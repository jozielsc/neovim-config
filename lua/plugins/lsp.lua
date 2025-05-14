return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities()
    )

    -- Pyright: apenas para IntelliSense (sem análise ou format)
    lspconfig.pyright.setup({
      capabilities = capabilities,
      settings = {
        pyright = { disableOrganizeImports = true },
        python = {
          analysis = { ignore = { "*" } }, -- ignora análise do Pyright, deixa pro Ruff
        },
      },
    })

    -- Ruff LSP (substitui ruff_lsp)
    lspconfig.ruff.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("RuffFormatOnSave", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
      init_options = {
        settings = {
          args = {}, -- Coloque flags extras do Ruff aqui se desejar
        },
      },
    })
  end,
}

