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
      
      -- ADD THE FIX HERE:
      -- Force the correct root directory
      opts.root_dir = function(fname)
        local util = require("lspconfig.util")
        local settings_gradle = util.root_pattern("settings.gradle", "settings.gradle.kts")(fname)
        if settings_gradle then
          return settings_gradle
        end
        return util.root_pattern("PnlEngine2Api", "SVSoftware", "TraderServer")(fname)
      end
      
      -- Set unique workspace directory
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
      opts.cmd = vim.list_extend(opts.cmd or {}, {
        '-data', os.getenv('HOME') .. '/.cache/jdtls-workspace/' .. project_name
      })
      
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
