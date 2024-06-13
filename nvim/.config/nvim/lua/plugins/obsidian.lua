---@diagnostic disable: missing-fields
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
        {
          name = 'second-brain',
          path = '~/Dev/obsidian/second-brain/',

          overrides = {
            notes_subdir = 'Atomic-notes/Fleeting-notes',
            daily_notes = {
              folder = 'Atomic-notes/Daily-notes',
              date_format = '%Y-%m-%d',
              alias_format = '%B %-d, %Y',
              template = 'Templates/Daily-template.md',
            },
          },
        },
      },

      attachments = {
        img_folder = 'Files', -- This is the default
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format('![%s](%s)', path.name, path)
        end,
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

      templates = {
        folder = 'Templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
    }
  end,
}
