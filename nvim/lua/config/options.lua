-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set indentation to 2 spaces
vim.opt.tabstop = 4 -- A tab character appears as 2 spaces
vim.opt.shiftwidth = 4 -- Indentation operations use 2 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.softtabstop = 4 -- Tab key inserts 2 spaces

vim.lsp.handlers["$/progress"] = function() end
vim.lsp.handlers["window/showMessage"] = function() end
vim.lsp.handlers["window/logMessage"] = function() end

vim.lsp.inlay_hint.enable(false)

vim.opt.autoread = true
