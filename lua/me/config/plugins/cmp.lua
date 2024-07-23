local M = {}

M.setup = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')

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

    ---@diagnostic disable-next-line: missing-fields
    formatting = {
      format = function(_, item)
        local icons = Core.icons.lsp().kinds
        if icons[item.kind] then
          item.kind = icons[item.kind] .. item.kind
        end

        local widths = {
          abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
          menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
        }

        for key, width in pairs(widths) do
          if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
            item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. '…'
          end
        end

        return item
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
        ---@diagnostic disable-next-line: redundant-parameter
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

    ---@diagnostic disable-next-line: missing-fields
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        -- require('cmp-under-comparator').under,
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
