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
      ['<c-d>'] = cmp.mapping.scroll_docs(-4),
      ['<c-f>'] = cmp.mapping.scroll_docs(4),
      ['<c-e>'] = cmp.mapping.abort(),
      ['<c-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<c-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<c-space>'] = cmp.mapping.complete(),
      ['<tab>'] = cmp.config.disable,
      ['<Cr>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ['<c-y>'] = cmp.mapping(
        cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        { 'i', 'c' }
      ),
    },

    sources = {
      { name = 'path', priority_weight = 110 },
      { name = 'nvim_lsp', max_item_count = 20, priority_weight = 100 },
      { name = 'nvim_lua', priority_weight = 90 },
      { name = 'luasnip', priority_weight = 80 },
      {
        name = 'buffer',
        max_item_count = 5,
        priority_weight = 50,
        entry_filter = function(entry)
          return not entry.exact
        end,
      },
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
      {
        name = 'look',
        keyword_length = 5,
        max_item_count = 5,
        option = { convert_case = true, loud = true },
        priority_weight = 40,
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
