return {

  -- NVIM CMP
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      require "configs.cmp"
    end,
  },

  -- COPILOT
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      enable = false,
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  -- COPILOT CMP
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- REFACTORING
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },

  -- TMUX NAVIGATOR
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },

  -- NVIM TODO-COMMENTS
  {
    "folke/todo-comments.nvim",
    lazy = false,
    requires = "nvim-lua/plenary.nvim",
    opts = function()
      return require "configs.todocomments" -- use return required
    end,
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },
}
