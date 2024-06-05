return {
  -- NOTE: COLORSCHEME
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      -- enable colorscheme
      vim.cmd.colorscheme 'catppuccin-mocha'

      -- Config highlight
      vim.cmd.hi 'Comment gui=none'
    end,
    config = function()
      require('catppuccin').setup {
        integrations = {
          alpha = true,
          cmp = true,
          gitsigns = true,

          indent_blankline = {
            enabled = true,
            scope_color = 'text', -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false,
          },

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
    end,
  },
}
