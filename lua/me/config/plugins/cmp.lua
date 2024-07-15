local M = {}

M.setup = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local icons = require('me.config.icons').lsp.kinds

  vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

  cmp.setup({
    window = {
      completion = {
        completeopt = 'menu,menuone,noinsert',
        border = 'rounded',
      },
      documentation = {
        border = 'rounded',
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      },
    },

    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
          codeium = '[codeium]',
          nvim_lsp = '[lsp]',
          buffer = '[buf]',
          luasnip = '[snip]',
          nvim_lua = '[lua]',
          path = '[path]',
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
      ['<C-y>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }, { 'i', 'c' }),
      ['<c-space>'] = cmp.mapping.complete(),
    },

    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
    },

    experimental = {
      ghost_text = {
        hl_group = 'CmpGhostText',
      },
    },

    -- sorting = defaults.sorting,

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

  -- setup for vim-dadbod
  cmp.setup.filetype('sql', {
    sources = {
      { name = 'vim-dadbod-completion' },
      { name = 'buffer' },
    },
  })

  -- setup for gitcommit
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'conventionalcommits' },
    }, {
      { name = 'buffer' },
    }),
  })
end

return M
