local load_capabilities = function()
  local capabilities = require('me.plugins.lsp.utils').capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }
  capabilities.textDocument.codeAction = {
    dynamicRegistration = false,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = {
          '',
          'quickfix',
          'refactor',
          'refactor.extract',
          'refactor.inline',
          'refactor.rewrite',
          'source',
          'source.organizeImports',
        },
      },
    },
  }
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  return capabilities
end

local add_whichkey = function(client, buffer)
  local wk_present, wk = pcall(require, 'which-key')
  if wk_present and client.name == 'tsserver' then
    wk.register({
      mode = { 'n', 'v' },
      ['<leader>lt'] = { name = '+typescript' },
    })
    -- luacheck: ignore
    vim.keymap.set(
      'n',
      '<leader>lto',
      '<CMD>TypescriptOrganizeImports<CR>',
      { buffer = buffer, desc = '[T]ypescript [O]rganize Imports' }
    )
    vim.keymap.set(
      'n',
      '<leader>ltr',
      '<CMD>TypescriptRenameFile<CR>',
      { desc = '[T]ypescript [R]ename File', buffer = buffer }
    )
    vim.keymap.set(
      'n',
      '<leader>ltf',
      '<CMD>TypescriptFixAll<CR>',
      { desc = '[T]ypescript [F]ix All', buffer = buffer }
    )
    vim.keymap.set(
      'n',
      '<leader>ltR',
      '<CMD>TypescriptRemoveUnused<CR>',
      { desc = '[T]ypescript [R]emove Unused', buffer = buffer }
    )
  end
end

local function filterReactDTS(value)
  -- Depending on typescript version either uri or targetUri is returned
  if value.uri then
    return string.match(value.uri, '%.d.ts') == nil
  elseif value.targetUri then
    return string.match(value.targetUri, '%.d.ts') == nil
  end
end

local function filter(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
  ['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }
  ),
  ['textDocument/definition'] = function(err, result, method, ...)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
    end

    vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
  end,
}

local settings = {
  typescript = {
    inlayHints = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeInlayEnumMemberValueHints = true,
    },
    suggest = {
      includeCompletionsForModuleExports = true,
    },
  },
  javascript = {
    inlayHints = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeInlayEnumMemberValueHints = true,
    },
    suggest = {
      includeCompletionsForModuleExports = true,
    },
  },
}

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
      -- "lvimuser/lsp-inlayhints.nvim",
    },
    opts = {
      servers = {
        tsserver = {
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require('me.plugins.lsp.utils').on_attach(function(client, buffer)
            add_whichkey(client, buffer)
            -- require("lsp-inlayhints").on_attach(client, buffer)
          end)
          -- require("typescript").setup({ server = opts })
          require('typescript').setup({
            server = {
              capabilities = load_capabilities(),
              settings = settings,
              handlers = handlers,
            },
          })
          return true
        end,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'tsx', 'ts', 'javascript', 'typescript' })
      end
    end,
  },
}
