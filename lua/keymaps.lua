
vim.g.mapleader = " "

-- Navegação entre splits
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Inserção rápida de linhas
vim.keymap.set("n", "op", "o<Esc>k")
vim.keymap.set("n", "oi", "O<Esc>j")
vim.keymap.set("n", "oo", "A<CR>")

-- Abas
vim.keymap.set("n", "te", ":tabe<CR>")
vim.keymap.set("n", "ty", ":bn<CR>")
vim.keymap.set("n", "tr", ":bp<CR>")

vim.keymap.set("n", "tw", ":w<CR>")
vim.keymap.set("n", "tq", ":q<CR>")

-- Organizar imports (COC)
vim.keymap.set("n", "<leader>oi", ":call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>")
