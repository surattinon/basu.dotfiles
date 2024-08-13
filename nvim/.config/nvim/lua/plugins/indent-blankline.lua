return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = 'VeryLazy',
  opts = {
    indent = {
      char = '▏',
      highlight = 'IndentBlanklineChar',
    },
    scope = {
      highlight = 'IndentBlanklineContextChar',
      show_start = false,
      show_end = false,
    },
  },
}
