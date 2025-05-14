local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lay.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.api.nvim_create_autocmd("BufRead",{
    pattern = "*.qmd",
    callback = function()
        vim.g.quarto_enabled = true
    end,
})

vim.opt.rtp:prepend(lazypath)

require("options")
require("mappings")
--require("coc")
local plugins = require("plugins")
require("lazy").setup(plugins)
