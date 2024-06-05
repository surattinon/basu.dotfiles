return {
  -- NOTE: NOICE UI
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      local noice = require 'noice'

      noice.setup {
        cmdline = {
          enabled = true, -- enables the Noice cmdline UI
          view = 'cmdline_popup', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
          opts = {}, -- global options for the cmdline. See section on views
          format = {
            cmdline = { pattern = '^:', icon = '', lang = 'vim' },
            search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
            search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
            filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
            lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
            help = { pattern = '^:%s*he?l?p?%s+', icon = '󰞋' },
            input = {}, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
          },
        },

        presets = {
          command_palette = true,
        },

        popupmenu = { enabled = false },
        notify = { enabled = false },
        lsp = {
          progress = { enabled = false },
          hover = { enabled = true },
          signature = { enabled = true },
        },
        message = { enabled = false },
      }
    end,
  },
}
