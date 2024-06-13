return {
  -- NOTE: WORKSPACE
  {
    'sanathks/workspace.nvim',
    lazy = false,
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local workspace = require 'workspace'
      workspace.setup {
        workspaces = {
          { name = 'Dev', path = '~/Dev', keymap = { '<leader>w1' } },
          { name = 'Programming 2', path = '~/Projects/STIU/Y3T2/Programming-II', keymap = { '<leader>w2' } },
        },
      }

      -- NOTE: KEYMAPS
      local map = vim.keymap.set
      map('n', '<leader>wt', workspace.tmux_sessions, { desc = '[W]orkspace [T]mux window' })
    end,
  },
}
