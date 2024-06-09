return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      columns = {
        'icon',
        'size',
      },
      experimental_watch_for_changes = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      float = {
        padding = 5,
        max_width = 130,
        max_height = 100,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
      },
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = 'actions.select_vsplit',
        ['<C-h>'] = 'actions.select_split',
        ['<C-t>'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['q'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      use_default_keymaps = true,
    }
    vim.keymap.set('n', '-', ':lua require("oil").open_float()<CR>', { noremap = true, silent = true })
  end,
}
