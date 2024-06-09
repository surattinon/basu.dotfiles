return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'meuter/lualine-so-fancy.nvim',
  },
  opts = {
    options = {
      theme = 'iceberg_dark',
      component_separators = { left = '│', right = '│' },
      section_separators = { left = '', right = '' },
      globalstatus = false,
      refresh = {
        statusline = 100,
      },
    },
    sections = {
      lualine_a = {
        { 'fancy_mode', width = 3 },
      },
      lualine_b = {
        { 'fancy_branch' },
        { 'fancy_diff' },
      },
      lualine_c = {
        { 'fancy_cwd', substitute_home = true },
        {
          'filename',
          file_status = true,
          path = 1,
        },
      },
      lualine_x = {
        { 'fancy_macro' },
        { 'fancy_diagnostics' },
        { 'fancy_searchcount' },
        { 'fancy_location' },
      },
      lualine_y = {
        { 'fancy_filetype', ts_icon = '' },
      },
      lualine_z = {
        { 'fancy_lsp_servers' },
      },
    },
  },
}
