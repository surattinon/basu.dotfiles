return {
  -- {
  --   'mfussenegger/nvim-jdtls',
  -- },
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-refactor',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      },
    },
    config = function()
      -- NOTE: SETUP JAVA AND JDTLS
      require('java').setup {
        jdk = {
          auto_install = false,
        },
      }
      require('lspconfig').jdtls.setup {
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = 'OpenJDK-21',
                  path = '/usr/lib64/jvm/java-21-openjdk',
                  default = true,
                },
              },
            },
          },
        },
        handlers = {
          -- By assigning an empty function, you can remove the notifications
          -- printed to the cmd
          ['$/progress'] = function(_, result, ctx) end,
        },
      }
    end,
  },
}
