return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    version = '*',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                Basu_notes = '~/Projects/neorg-notes',
              },
              default_workspace = 'Basu_notes',
            },
          },
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.export.markdown'] = {
            config = {
              extensions = { 'md' },
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
