return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'BufReadPre',
  config = function()
    local rainbowsetup = require 'rainbow-delimiters.setup'
    local rainbow = require 'rainbow-delimiters'
    rainbowsetup.setup {
      strategy = {
        [''] = rainbow.strategy['global'],
        vim = rainbow.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
