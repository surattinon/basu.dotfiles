require("nvim-tree").setup {
  view = {
    width = 45,
    relativenumber = true,
  },
  renderer = {
    icons = {
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = false,
          color = true,
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
      ignore_list = {},
    },
    exclude = false,
  },
}
