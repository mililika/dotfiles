return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    toggle = { map = LazyVim.safe_keymap_set },
    words = { enabled = true },
    -- explorer = {
    --   enabled = true,
    -- },
    -- picker = {
    --   enabled = true,
    --   sources = {
    --     explorer = {
    --       win = {
    --         list = {
    --           wo = {
    --             number = true,
    --             relativenumber = true,
    --           },
    --         },
    --       },
    --     },
    --   },
    -- },
  },
  -- stylua: ignore
  keys = {
    { "<leader>n", function()
      if Snacks.config.picker and Snacks.config.picker.enabled then
        Snacks.picker.notifications()
      else
        Snacks.notifier.show_history()
      end
    end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>ff", function() Snacks.picker.files({ cwd = vim.fn.getcwd() }) end, desc = "Find Files (Root)" },
    { "<leader>fF", function() Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Find Files (cwd)" },
  },
}
