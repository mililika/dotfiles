-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto reload files when changed externally
local auto_reload_group = vim.api.nvim_create_augroup("auto-reload", { clear = true })

-- Check for file changes more frequently in tmux
vim.api.nvim_create_autocmd({
  "FocusGained",
  "BufEnter",
  "CursorHold",
  "CursorHoldI",
  "WinEnter",
  "CmdwinEnter",
}, {
  group = auto_reload_group,
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- Also check when switching tmux panes
vim.api.nvim_create_autocmd("User", {
  group = auto_reload_group,
  pattern = "TmuxFocusGained",
  callback = function()
    vim.cmd("checktime")
  end,
})
