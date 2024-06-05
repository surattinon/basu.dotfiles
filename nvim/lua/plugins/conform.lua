return {
  -- { -- Autoformat
  --   'stevearc/conform.nvim',
  --   lazy = false,
  --   keys = {
  --     {
  --       '<leader>f',
  --       function()
  --         require('conform').format { async = true, lsp_fallback = true }
  --       end,
  --       mode = '',
  --       desc = '[F]ormat buffer',
  --     },
  --   },
  --   opts = {
  --     notify_on_error = true,
  --     format_on_save = function(bufnr)
  --       -- Disable "format_on_save lsp_fallback" for languages that don't
  --       -- have a well standardized coding style. You can add additional
  --       -- languages here or re-enable it for the disabled ones.
  --       local disable_filetypes = { c = true, cpp = true }
  --       return {
  --         timeout_ms = 500,
  --         lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
  --       }
  --     end,
  --     formatters_by_ft = {
  --       bash = { 'shfmt' },
  --       sh = { 'shfmt' },
  --       fish = { 'fish_indent' },
  --       lua = { 'stylua' },
  --       go = { 'goimports', 'gofumpt', 'goimports-reviser' },
  --       javascript = { { 'prettierd', 'prettier' } },
  --       typescript = { { 'prettierd', 'prettier' } },
  --       javascriptreact = { { 'prettierd', 'prettier' } },
  --       typescriptreact = { { 'prettierd', 'prettier' } },
  --       vue = { { 'prettierd', 'prettier' } },
  --       css = { { 'prettierd', 'prettier' } },
  --       scss = { { 'prettierd', 'prettier' } },
  --       less = { { 'prettierd', 'prettier' } },
  --       html = { { 'prettierd', 'prettier' } },
  --       json = { { 'prettierd', 'prettier' } },
  --       jsonc = { { 'prettierd', 'prettier' } },
  --       yaml = { { 'prettierd', 'prettier' } },
  --       markdown = { { 'prettierd', 'prettier' } },
  --       ['markdown.mdx'] = { { 'prettierd', 'prettier' } },
  --       graphql = { { 'prettierd', 'prettier' } },
  --       handlebars = { { 'prettierd', 'prettier' } },
  --       ['*'] = { 'codespell' },
  --     },
  --   },
  -- },

  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufWritePre' },
    config = function()
      local conform = require 'conform'
      conform.setup {
        formatters_by_ft = {
          bash = { 'shfmt' },
          sh = { 'shfmt' },
          fish = { 'fish_indent' },
          lua = { 'stylua' },
          go = { 'goimports', 'gofumpt', 'goimports-reviser' },
          java = { 'google-java-format' },
          javascript = { { 'prettierd', 'prettier' } },
          typescript = { { 'prettierd', 'prettier' } },
          javascriptreact = { { 'prettierd', 'prettier' } },
          typescriptreact = { { 'prettierd', 'prettier' } },
          vue = { { 'prettierd', 'prettier' } },
          css = { { 'prettierd', 'prettier' } },
          scss = { { 'prettierd', 'prettier' } },
          less = { { 'prettierd', 'prettier' } },
          html = { { 'prettierd', 'prettier' } },
          json = { { 'prettierd', 'prettier' } },
          jsonc = { { 'prettierd', 'prettier' } },
          yaml = { { 'prettierd', 'prettier' } },
          markdown = { { 'prettierd', 'prettier' } },
          ['markdown.mdx'] = { { 'prettierd', 'prettier' } },
          graphql = { { 'prettierd', 'prettier' } },
          handlebars = { { 'prettierd', 'prettier' } },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      }
      local map = vim.keymap.set
      map({ 'n', 'v' }, '<leader>cf', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end, { desc = '[C]ode [F]ormat' })
    end,
  },
}
