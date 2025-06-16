return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        enabled = false, -- This is all you need
      },
    },
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-y>"] = { "accept" },
      ["<Esc>"] = { "hide", "fallback" },
      -- Disable default navigation
      ["<C-n>"] = {},
      ["<C-p>"] = {},
    },
  },
}
