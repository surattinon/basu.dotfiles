return {
  'lukas-reineke/indent-blankline.nvim',
  branch = 'v3',
  event = 'VeryLazy',
  config = function()
    require('ibl').setup {
      indent = {
        char = '▏',
        highlight = 'IndentBlanklineChar',
      },
      scope = {
        highlight = 'IndentBlanklineContextChar',
        show_start = false,
        show_end = false,
      },
    }
  end,
}
