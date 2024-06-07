return {
  -- NOTE: Tokyodark
  {
    'tiagovla/tokyodark.nvim',
    opts = {},
    config = function(_, opts)
      require('tokyodark').setup(opts)
    end,
  },

  -- NOTE: CATPPUCCIN
  {
    'catppuccin/nvim',
    name = 'catppuccin',
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
      if vim.g.neovide then
        vim.cmd [[colorscheme tokyodark]]
      else
        vim.cmd [[colorscheme catppuccin-mocha]]
      end
    end,
  },
}
