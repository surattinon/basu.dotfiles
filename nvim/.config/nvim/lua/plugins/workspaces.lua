return {
  -- NOTE: WORKSPACE
  {
    'sanathks/workspace.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local workspace = require 'workspace'
      workspace.setup {
        workspaces = {
          { name = 'Dev', path = '~/Dev', keymap = { '<leader>w1', { desc = 'Dev workspaces' } } },
          { name = 'Programming 1 (Assignment)', path = '~/Projects/STIU/Y3T2/Programming-II/Submissions/Assignments/', keymap = { '<leader>w2' } },
          { name = 'Programming 1 (Class Activity)', path = '~/Projects/STIU/Y3T2/Programming-II/Submissions/Class-activities/', keymap = { '<leader>w3' } },
        },
      }

      -- NOTE: KEYMAPS
      local map = vim.keymap.set
      map('n', '<leader>wn', workspace.tmux_sessions, { desc = '[W]orkspace [N]ew Tmux window' })
    end,
  },
}
