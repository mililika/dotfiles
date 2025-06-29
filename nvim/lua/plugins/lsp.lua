return {
  -- LSP configurations

  -- Pyright LSP
  {
    "neovim/nvim-lspconfig", 
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
      },
    },
  },
}