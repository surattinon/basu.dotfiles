return {
  -- NOTE: tokyonight
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local tokyonight = require 'tokyonight'
  --     if vim.g.neovide then
  --       tokyonight.setup {
  --         transparent = false,
  --         style = 'night',
  --       }
  --     else
  --       tokyonight.setup {
  --         transparent = true,
  --         style = 'night',
  --       }
  --     end
  --     vim.cmd [[colorscheme tokyonight]]
  --   end,
  -- },
  -- NOTE: Tokyodark
  -- {
  --   'tiagovla/tokyodark.nvim',
  --   config = function()
  --     -- vim.cmd [[colorscheme tokyodark]]
  --   end,
  -- },

  -- NOTE: CATPPUCCIN
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    init = function()
      -- Config highlight
      vim.cmd.hi 'Comment gui=none'
    end,
    config = function()
      local catppuccin = require 'catppuccin'
      catppuccin.setup {
        transparent_background = true,
        integrations = {
          alpha = true,
          cmp = true,
          mason = true,

          mini = {
            enabled = true,
            indentscope_color = 'text',
          },

          neotree = true,
          dap = true,
          dap_ui = true,

          -- NOTE: Theme for nvim-lspconfig
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { 'italic' },
              hints = { 'italic' },
              warnings = { 'italic' },
              information = { 'italic' },
              ok = { 'italic' },
            },
            underlines = {
              errors = { 'underline' },
              hints = { 'underline' },
              warnings = { 'underline' },
              information = { 'underline' },
              ok = { 'underline' },
            },
            inlay_hints = {
              background = true,
            },
          },

          telescope = {
            enabled = true,
            style = 'nvchad',
          },
          which_key = true,
        },
      }
      vim.cmd [[colorscheme catppuccin-mocha]]
    end,
  },
}
