return {
  -- NOTE: NV TERM
  {
    'NvChad/nvterm',
    config = function()
      local opts = {
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = 'editor',
              row = 0.3,
              col = 0.25,
              width = 0.5,
              height = 0.4,
              border = 'single',
            },
            horizontal = { location = 'rightbelow', split_ratio = 0.3 },
            vertical = { location = 'rightbelow', split_ratio = 0.5 },
          },
        },
      }
      require('nvterm').setup(opts)

      -- NOTE: KEYMAPS
      local toggle_modes = { 'n', 't' }
      local map = vim.keymap.set
      map(toggle_modes, '<C-t>', function()
        require('nvterm.terminal').toggle 'horizontal'
      end)
    end,
  },
}
