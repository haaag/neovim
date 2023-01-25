-- cmp.lua
-- https://github.com/hrsh7th/nvim-cmp

local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind-nvim",
    "rafamadriz/friendly-snippets",
    "octaltree/cmp-look",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    { "tzachar/cmp-tabnine", build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
  },
}

function M.config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local colors = require("me.config.colors").current()

  -- Set completeopt to have a better completion experience
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  -- Load vsCode snippets
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({

    completion = {
      autocomplete = false,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,

        function(entry1, entry2)
          local _, entry1_under = entry1.completion_item.label:find("^_+")
          local _, entry2_under = entry2.completion_item.label:find("^_+")
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,

        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

    sources = {
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lsp", keyword_length = 3 },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer", keyword_length = 5, max_item_count = 10 },
      { name = "cmp_tabnine" },
      {
        name = "look",
        keyword_length = 5,
        max_item_count = 5,
        option = { convert_case = true, loud = true },
        priority_weight = 40,
      },
    },

    --[[ formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[lsp]",
          nvim_lsp_signature_help = "[sign]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
          cmp_tabnine = "[t9]",
          look = "[look]",
        },
      }),
    }, ]]

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. (strings[1] or "") .. " "
        kind.menu = "    (" .. (strings[2] or "") .. ")"

        return kind
      end,
    },

    view = {
      -- entries = { name = "custom", selection_order = "near_cursor" }, -- can be "custom", "wildmenu" or "native"
      entries = "custom",
    },
  })

  vim.keymap.set("i", "<C-x><C-o>", "<CMD>lua require('cmp').complete()<CR>", { desc = "Invoke Completion" })
end

return M
