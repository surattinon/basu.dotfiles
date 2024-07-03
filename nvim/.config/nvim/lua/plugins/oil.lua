return {
  'stevearc/oil.nvim',
  dependencies = {
    'SirZenith/oil-vcs-status',
  },
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

      -- oil-vcs-status
      win_options = {
        signcolumn = 'number',
      },
    }

    local status_const = require 'oil-vcs-status.constant.status'
    local StatusType = status_const.StatusType
    require('oil-vcs-status').setup {
      -- Executable path of each version control system.
      vcs_executable = {
        git = 'git',
        svn = 'svn',
        signcolumn = 'yes:2',
      },
      status_symbol = {
        [StatusType.Added] = '',
        [StatusType.Copied] = '󰆏',
        [StatusType.Deleted] = '',
        [StatusType.Ignored] = '',
        [StatusType.Modified] = '',
        [StatusType.Renamed] = '',
        [StatusType.TypeChanged] = '󰉺',
        [StatusType.Unmodified] = ' ',
        [StatusType.Unmerged] = '',
        [StatusType.Untracked] = '',
        [StatusType.External] = '',

        [StatusType.UpstreamAdded] = '󰈞',
        [StatusType.UpstreamCopied] = '󰈢',
        [StatusType.UpstreamDeleted] = '',
        [StatusType.UpstreamIgnored] = ' ',
        [StatusType.UpstreamModified] = '󰏫',
        [StatusType.UpstreamRenamed] = '',
        [StatusType.UpstreamTypeChanged] = '󱧶',
        [StatusType.UpstreamUnmodified] = ' ',
        [StatusType.UpstreamUnmerged] = '',
        [StatusType.UpstreamUntracked] = ' ',
        [StatusType.UpstreamExternal] = '',
      },
    }

    vim.keymap.set('n', '-', ':lua require("oil").open_float()<CR>', { noremap = true, silent = true })
  end,
}
