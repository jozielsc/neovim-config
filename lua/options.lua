
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.syntax = "on"
vim.opt.cmdheight = 2
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.opt.cursorline = true
        vim.opt.cursorcolumn = true
    end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.opt.cursorline = false
        vim.opt.cursorcolumn = false
    end,
})
