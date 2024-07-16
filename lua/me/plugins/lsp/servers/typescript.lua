return { -- https://github.com/yioneko/vtsls
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tsserver = {
          enabled = false,
        },
        vtsls = {
          -- explicitly add default filetypes, so that we can extend
          -- them in related extras
          filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = 'always' },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = 'literals' },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          --[[ require('me.plugins.lsp.utils').on_attach(function(client, buffer)
            -- add_whichkey(client, buffer)
            -- require("lsp-inlayhints").on_attach(client, buffer)
          end)
          -- require("typescript").setup({ server = opts })
          require('typescript').setup({
            server = {
              capabilities = load_capabilities(),
              settings = settings,
              handlers = handlers,
            },
          }) ]]
          return true
        end,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'tsx', 'javascript', 'typescript' })
      end
    end,
  },
}
