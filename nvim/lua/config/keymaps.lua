-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Center screen after navigation jumps
vim.keymap.set("n", "<C-o>", "<C-o>zz", { desc = "Jump back and center" })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { desc = "Jump forward and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })

-- Center screen after search jumps
vim.keymap.set("n", "n", "nzz", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous search result and center" })

-- Center screen after line jumps
vim.keymap.set("n", "G", "Gzz", { desc = "Go to end and center" })
vim.keymap.set("n", "gg", "ggzz", { desc = "Go to start and center" })

-- Center screen after LSP navigation (go to definition, references, etc.)
vim.keymap.set("n", "gd", function()
  vim.lsp.buf.definition()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 100)
end, { desc = "Go to definition and center" })

vim.keymap.set("n", "gD", function()
  vim.lsp.buf.declaration()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 100)
end, { desc = "Go to declaration and center" })

vim.keymap.set("n", "gr", function()
  vim.lsp.buf.references()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 100)
end, { desc = "Go to references and center" })

vim.keymap.set("n", "gi", function()
  vim.lsp.buf.implementation()
  vim.defer_fn(function()
    vim.cmd("normal! zz")
  end, 100)
end, { desc = "Go to implementation and center" })

-- Center after mark jumps
vim.keymap.set("n", "'", "'zz", { desc = "Jump to mark and center" })
vim.keymap.set("n", "`", "`zz", { desc = "Jump to mark position and center" })

-- Center after bracket/parenthesis jumps
vim.keymap.set("n", "%", "%zz", { desc = "Jump to matching bracket and center" })

-- Center after paragraph jumps
vim.keymap.set("n", "}", "}zz", { desc = "Next paragraph and center" })
vim.keymap.set("n", "{", "{zz", { desc = "Previous paragraph and center" })
