# 🧠 Neovim Configuração Modular com LSP e Ruff (com suporte a Quarto)

Esta é uma configuração modular para o **Neovim** rodando na distro **Alpine Linux**, com foco em produtividade para Python e documentos Quarto, com recursos como:

- Suporte completo ao LSP via `pyright`
- Formatação e linting com `ruff`
- Autocompletar com `nvim-cmp`
- Árvore de arquivos com `nvim-tree`
- Pesquisa de arquivos com `telescope.nvim`
- Destaque de linha/coluna do cursor
- Plugin Quarto
- Barra de status `vim-airline`
- Tema Sonokai

---

## ✅ Requisitos

- Neovim >= 0.10
- Python 3.10+
- Node.js (para alguns plugins como `coc` ou LSP)
- `pip install ruff`
- [Quarto](https://quarto.org/) -> Script container/docker [Aqui]()
- Git
- Fonte com suporte a NerdFont (ex: [FiraCode Nerd Font](https://www.nerdfonts.com/))

---

## 📦 Plugins utilizados

- `folke/lazy.nvim` — Gerenciador de plugins
- `sainnhe/sonokai` — Tema
- `nvim-treesitter/nvim-treesitter` — Realce de sintaxe
- `vim-airline/vim-airline` — Barra de status
- `hrsh7th/nvim-cmp` — Autocompletar
- `neovim/nvim-lspconfig` — Suporte a LSP
- `quarto-dev/quarto-nvim` — Suporte a Quarto
- `jmbuhr/otter.nvim` — Integração com Quarto
- `nvim-tree/nvim-tree.lua` — Navegador de arquivos
- `nvim-lua/plenary.nvim` — Dependência do Telescope
- `nvim-telescope/telescope.nvim` — Pesquisa de arquivos
- `lukas-reineke/lsp-format.nvim` — Formatação automática com LSP
- `hrsh7th/cmp-nvim-lsp`, `cmp-buffer`, `cmp-path`, `cmp-cmdline`, `LuaSnip`, `cmp_luasnip`

---

## 🔧 Estrutura dos Arquivos

```text
nvim/
├── init.lua
└── lua/
    ├── core/
    │   ├── autocmds.lua
    │   ├── options.lua
    │   └── mappings.lua
    └── plugins/
        ├── editor.lua
        ├── lsp.lua
        ├── cmp.lua
        ├── quarto.lua
        ├── tree.lua
        ├── telescope.lua
        ├── sonokai.lua
        └── ruff.lua
```
---

## 🧪 Funcionalidades

- Formatação automática com Ruff: Sempre que salvar um arquivo Python, o Ruff irá formatá-lo automaticamente.
- Autocompletar com LSP + Snippets
- Navegação com árvore (<leader>e)
- Pesquisa com Telescope (<leader>ff, <leader>fg, etc)
- Destaque de linha/coluna no modo insert
- Compatível com documentos .qmd (Quarto)

---


## 🛠️ Comandos Úteis
- Abrir árvore de arquivos: <leader>e
- Buscar arquivos: <leader>ff
- Buscar por palavra: <leader>fg
- Organizar imports com Coc (caso usado): <leader>oi
- Novo tab: te, Próx.: ty, Ant.: tr
- Fechar aba: tq, Salvar: tw
