return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = "none",
            },
          },
          configuration = {
            runtimes = {
              {
                name = "JavaSE-17",
                path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
                default = true,
              },
              {
                name = "JavaSE-21",
                path = "/opt/homebrew/Cellar/openjdk@21/21.0.7/libexec/openjdk.jdk/Contents/Home",
              },
            },
          },
          compile = {
            nullAnalysis = {
              mode = "automatic",
            },
          },
          format = {
            settings = {
              url = "file://" .. os.getenv("HOME") .. "/.config/nvim/eclipse-formatter.xml",
              profile = "Eclipse",
            },
          },
        },
      })

      return opts
    end,
  },
}
