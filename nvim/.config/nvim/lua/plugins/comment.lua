---@diagnostic disable: missing-fields
return {
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    event = 'BufReadPre',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = {},
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
}
