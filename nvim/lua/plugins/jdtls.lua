return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Detect operating system
      local is_mac = vim.fn.has("macunix") == 1
      local is_linux = vim.fn.has("unix") == 1 and not is_mac
      
      -- Set JAVA_HOME environment variable for jdtls
      if is_linux then
        vim.env.JAVA_HOME = "/usr/lib/jvm/java-21-openjdk-amd64"
      elseif is_mac then
        vim.env.JAVA_HOME = "/opt/homebrew/Cellar/openjdk@21/21.0.7/libexec/openjdk.jdk/Contents/Home"
      end

      -- Set Java runtime paths based on OS
      local java_runtimes = {}
      if is_mac then
        java_runtimes = {
          {
            name = "JavaSE-17",
            path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home",
            default = true,
          },
          {
            name = "JavaSE-21",
            path = "/opt/homebrew/Cellar/openjdk@21/21.0.7/libexec/openjdk.jdk/Contents/Home",
          },
        }
      elseif is_linux then
        java_runtimes = {
          {
            name = "JavaSE-17",
            path = "/opt/java",
            default = true,
          },
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk-amd64",
          },
        }
      end

      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = "none",
            },
          },
          configuration = {
            runtimes = java_runtimes,
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
