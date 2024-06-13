return {
  -- LSP CONFIG
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- MASON
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "jdtls",
      },
    },
  },

  -- NVIM JAVA
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
  },

  -- NVIM DAP ( For Debug )
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }, -- DAP UI
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", -- FOR DAP UI
      "leoluz/nvim-dap-go", -- GO DUBUG ADAPTOR
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      require("dapui").setup() -- Enable Dap UI

      require("dap-go").setup() -- Go Debug adaptor

      -- DAP KEYMAP
      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "DAP Continue" })
      vim.keymap.set("n", "<Leader>dd", dapui.toggle, { desc = "Toggle DEBUG UI" })

      -- DAP UI CONFIG
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      -- UNCOMMENT FOR BELOW AUTO CLOSE DAP UI
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   dapui.close()
      -- end
    end,
  },
}
