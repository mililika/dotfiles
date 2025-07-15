-- lua/plugins/java.lua
return {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "nvim-java/nvim-java-refactor",
    "mfussenegger/nvim-dap",  -- Ensure this matches your dap.lua version
    "williamboman/mason.nvim",
  },
  ft = { "java" },  -- Only load for Java files
  config = function()
    require("java").setup()
  end
}
