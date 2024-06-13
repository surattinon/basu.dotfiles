return {
  -- NOCIE
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "configs.noice"
    end,
  },

  -- SMOOTH SCROLL
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup { mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" } }
    end,
  },

  -- NVIM TREE CUSTOM
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "configs.nvimtree"
    end,
  },
}
