return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'Cargo.toml', 'go.mod', 'index.norg' },
    }
  end,
}
