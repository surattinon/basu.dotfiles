return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'basu-vault',
          path = '~/Nextcloud/mySMB/workspace/Obsidian-sync/basu-vault',
        },
        {
          name = 'dev-vault',
          path = '~/Dev/obsidian/dev-vault/',

          overrides = {
            notes_subdir = 'notes',
          },
        },

        -- This workspace will be used when no workspace is specified.
        {
          name = 'no-vault',
          path = function()
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
          end,
          overrides = {
            notes_subdir = 'vim.NIL',
            new_notes_location = 'current_dir',
            templates = {
              folder = 'vim.NIL',
            },
            disable_frontmatter = true,
          },
        },
      },

      daily_notes = {
        folder = 'notes/dailies',
        date_format = '%Y-%m-%d',
        alias_format = '%B %-d, %Y',
        template = nil,
      },

      new_notes_location = 'notes_subdir',

      log_level = vim.log.levels.INFO,
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      open_notes_in = 'vsplit',

      ---@param url string
      follow_url_func = function(url)
        vim.fn.jobstart { 'xdg-open', url }
      end,

      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,
    }
  end,
}
