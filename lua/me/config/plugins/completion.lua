local M = {}

local types = require('cmp.types')

local priority_map = {
  [types.lsp.CompletionItemKind.EnumMember] = 1,
  [types.lsp.CompletionItemKind.Variable] = 2,
  [types.lsp.CompletionItemKind.Text] = 100,
}

local kind = function(entry1, entry2)
  local kind1 = entry1:get_kind()
  local kind2 = entry2:get_kind()
  kind1 = priority_map[kind1] or kind1
  kind2 = priority_map[kind2] or kind2
  if kind1 ~= kind2 then
    if kind1 == types.lsp.CompletionItemKind.Snippet then
      return true
    end
    if kind2 == types.lsp.CompletionItemKind.Snippet then
      return false
    end
    local diff = kind1 - kind2
    if diff < 0 then
      return true
    elseif diff > 0 then
      return false
    end
  end
end

function M.setup()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local kind_icons = require('me.config.icons').icons.lsp.kinds
  local function border(hl_name)
    return {
      { '╭', hl_name },
      { '─', hl_name },
      { '╮', hl_name },
      { '│', hl_name },
      { '╯', hl_name },
      { '─', hl_name },
      { '╰', hl_name },
      { '│', hl_name },
    }
  end

  cmp.setup({
    --[[ completion = {
      autocomplete = false,
    }, ]]
    window = {
      completion = {
        border = border('FloatBorder'),
        scrollbar = false,
      },
      documentation = {
        border = border('FloatBorder'),
      },
    },

    --[[ experimental = {
      ghost_text = true,
    }, ]]

    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
          buffer = '[Buf]',
          codeium = '[Cod]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[API]',
          path = '[Path]',
          luasnip = '[Snip]',
          look = '[Look]',
          rg = '[RG]',
        })[entry.source.name]
        return vim_item
      end,
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.choice_active() then
          luasnip.change_choice(1)
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<Cr>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ['<c-space>'] = cmp.mapping.complete(),
    },

    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
      {
        name = 'rg',
        keyword_length = 5,
        max_item_count = 5,
        priority_weight = 60,
        option = {
          additional_arguments = '--smart-case --hidden',
        },
        entry_filter = function(entry)
          return not entry.exact
        end,
      },
    },

    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require('cmp-under-comparator').under,
        kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'conventionalcommits' },
    }, {
      { name = 'buffer' },
    }),
  })
end

return M
