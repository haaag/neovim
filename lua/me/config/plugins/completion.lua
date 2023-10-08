local M = {}

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

    window = {
      completion = {
        border = border('CmpDocBorder'),
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
        scrollbar = false,
      },
      documentation = {
        border = border('CmpDocBorder'),
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      },
    },

    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
          codeium = '[Codeium]',
          nvim_lsp = '[LSP]',
          buffer = '[Buffer]',
          luasnip = '[LuaSnip]',
          nvim_lua = '[Lua]',
          path = '[Path]',
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
    },

    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require('cmp-under-comparator').under,
        cmp.config.compare.kind,
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
