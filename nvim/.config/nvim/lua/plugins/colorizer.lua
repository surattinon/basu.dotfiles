return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      css = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        mode = 'background',
      },
      'javascript',
      html = { mode = 'background' },
    }, {
      mode = 'foreground',
    })
  end,
}
