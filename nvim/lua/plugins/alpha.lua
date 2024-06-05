return {
  -- NOTE: ALPHA DASHBOARD
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- NOTE: SET ASCII ART
      dashboard.section.header.val = {
        '                                                    ',
        '                                                    ',
        '                                                    ',
        '                                                    ',
        '╓──────────────────────────────────────────────────╖',
        '║ ● ● ●          READY TO COOK!? 💻                ║',
        '╙──────────────────────────────────────────────────╜',
        '                                                    ',
        '                                                    ',
        '                                                    ',
        '███╗                 ██╗   ██╗██╗███╗   ███╗    ███╗',
        '██╔╝                 ██║   ██║██║████╗ ████║    ╚██║',
        '██║                  ██║   ██║██║██╔████╔██║     ██║',
        '██║   ╓──────╖       ╚██╗ ██╔╝██║██║╚██╔╝██║     ██║',
        '███╗  ║ BASU ║  ███╗  ╚████╔╝ ██║██║ ╚═╝ ██║    ███║',
        '╚══╝  ╙──────╜  ╚══╝   ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚══╝',
        '                                                    ',
        '                                                    ',
        '                                                    ',
        '╓──────────────────────────────────────────────────╖',
        '║        ██  BASU = () => CODE EAT SLEEP           ║',
        '╙──────────────────────────────────────────────────╜',
        '                                                    ',
        '                                                    ',
        '                                                    ',
        '                                                    ',
      }

      -- NOTE: SET MENU
      dashboard.section.buttons.val = {
        dashboard.button('n', '  > New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '󰈞  > Find file', ':Telescope find_files<CR>'),
        dashboard.button('g', '  > Find grep', ':Telescope grep_string<CR>'),
        dashboard.button('q', '󰈆  > Quit VIM', ':qa<CR>'),
      }

      -- Ampha config
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd [[
    autocmd FileType alpha setlocal nofoldenable
]]
    end,
  },
}
