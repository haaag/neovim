return {

  { -- snippets engine
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
    enabled = false,
  },

  -- { -- beautiful completion
  --   "hrsh7th/nvim-cmp",
  --   version = false, -- last release is way too old
  --   event = "InsertEnter",
  --   enabled = false,
  --   dependencies = {
  --     "saadparwaiz1/cmp_luasnip",
  --     -- "hrsh7th/cmp-buffer",
  --     -- "hrsh7th/cmp-path",
  --     "onsails/lspkind.nvim",
  --     "hrsh7th/cmp-nvim-lsp-signature-help",
  --     "hrsh7th/cmp-emoji",
  --     "octaltree/cmp-look",
  --     -- { "tzachar/cmp-tabnine", build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
  --   },
  --   opts = function()
  --     local cmp = require("cmp")
  --     -- local icons = require("me.config.icons").icons
  --     local source_mapping = {
  --       nvim_lsp = "[lsp]",
  --       -- buffer = "[buf]",
  --       -- codeium = "[ai]",
  --       nvim_lsp_signature_help = "[sign]",
  --       luasnip = "[snip]",
  --       nvim_lua = "[lua]",
  --       -- cmp_tabnine = "[t9]",
  --       -- path = "[path]",
  --       look = "[look]",
  --       emoji = "[emoji]",
  --     }
  --
  --     return {
  --       window = {
  --         completion = cmp.config.window.bordered(),
  --         documentation = cmp.config.window.bordered(),
  --       },
  --       --[[ window = {
  --         completion = {
  --           winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
  --           col_offset = -3,
  --           side_padding = 0,
  --         },
  --       }, ]]
  --       completion = {
  --         completeopt = "menu,menuone,noinsert",
  --         -- autocomplete = false,
  --       },
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       sorting = {
  --         priority_weight = 2,
  --         comparators = {
  --           cmp.config.compare.exact,
  --           cmp.config.compare.offset,
  --           cmp.config.compare.score,
  --           cmp.config.compare.recently_used,
  --           -- require("cmp_tabnine.compare"),
  --
  --           function(entry1, entry2)
  --             local _, entry1_under = entry1.completion_item.label:find("^_+")
  --             local _, entry2_under = entry2.completion_item.label:find("^_+")
  --             entry1_under = entry1_under or 0
  --             entry2_under = entry2_under or 0
  --             if entry1_under > entry2_under then
  --               return false
  --             elseif entry1_under < entry2_under then
  --               return true
  --             end
  --           end,
  --
  --           cmp.config.compare.kind,
  --           cmp.config.compare.sort_text,
  --           cmp.config.compare.length,
  --           cmp.config.compare.order,
  --         },
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-y>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }),
  --         ["<CR>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp", priority = 1 },
  --         { name = "nvim_lsp_signature_help" },
  --         -- { name = "codeium" },
  --         { name = "luasnip" },
  --         -- { name = "path" },
  --         -- { name = "buffer", keyword_length = 5, max_item_count = 10 },
  --         -- { name = "cmp_tabnine" },
  --         -- {
  --         --   name = "look",
  --         --   keyword_length = 5,
  --         --   max_item_count = 5,
  --         --   option = { convert_case = true, loud = true },
  --         --   priority_weight = 40,
  --         -- },
  --         -- { name = "emoji" },
  --       }),
  --
  --       --[[ formatting = {
  --         fields = { "kind", "abbr", "menu" },
  --         format = function(entry, vim_item)
  --           vim_item.kind = icons.lsp.kinds[vim_item.kind] .. " "
  --           vim_item.menu = source_mapping[entry.source.name]
  --           if entry.source.name == "cmp_tabnine" then
  --             local detail = (entry.completion_item.data or {}).detail
  --             vim_item.kind = ""
  --             if detail and detail:find(".*%%.*") then
  --               vim_item.kind = vim_item.kind .. " " .. detail
  --             end
  --
  --             if (entry.completion_item.data or {}).multiline then
  --               vim_item.kind = vim_item.kind .. " " .. "[ML]"
  --             end
  --           end
  --           local maxwidth = 80
  --           vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
  --           return vim_item
  --         end,
  --       }, ]]
  --
  --       -- Another kind of UI menu completion
  --       formatting = {
  --         fields = { "kind", "abbr", "menu" },
  --         format = function(entry, vim_item)
  --           local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
  --           local strings = vim.split(kind.kind, "%s", { trimempty = true })
  --
  --           -- tabnine
  --           if entry.source.name == "cmp_tabnine" then
  --             strings = { "", "TabNine" }
  --           end
  --
  --           kind.kind = " " .. (strings[1] or "") .. " "
  --           kind.menu = "    (" .. (strings[2] or "") .. ")"
  --           return kind
  --         end,
  --       },
  --
  --       view = {
  --         entries = "custom",
  --       },
  --     },
  --       cmp.setup.filetype({ "gitcommit", "markdown", "NeogitCommitMessage", "mail" }, {
  --         sources = cmp.config.sources({
  --           { name = "luasnip" },
  --           { name = "emoji" },
  --         }, {
  --           {
  --             name = "look",
  --             keyword_length = 5,
  --             max_item_count = 5,
  --             option = { convert_case = true, loud = true },
  --             priority_weight = 40,
  --           },
  --         }),
  --       })
  --   end,
  -- },

  { -- surround
    "echasnovski/mini.surround",
    keys = function(plugin, keys)
      -- Populate the keys based on the user's options
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      return vim.list_extend(mappings, keys)
    end,
    version = false,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
    enabled = true,
  },

  { -- https://github.com/ms-jpq/coq_nvim
    "ms-jpq/coq_nvim",
    branch = "coq",
    init = function()
      local icons = require("me.config.icons").icons
      vim.g.coq_settings = {
        auto_start = true,
        keymap = {
          pre_select = false,
          jump_to_mark = "<c-y>",
        },
        display = {
          icons = {
            mode = "long",
            mappings = icons.lsp.kinds,
          },
        },
        completion = {
          always = true,
          skip_after = {
            "{",
            "}",
            "[",
            "]",
          },
        },
        clients = {
          tags = { enabled = true, short_name = "tags" },
          tabnine = { enabled = false },
          tmux = { enabled = true, short_name = "tmux" },
          buffers = { same_filetype = true, short_name = "buf" },
          paths = { preview_lines = 3, short_name = "path" },
          lsp = { enabled = true, short_name = "lsp" },
          snippets = { enabled = true, short_name = "snip" },
          tree_sitter = {
            always_on_top = true,
            enabled = false,
            short_name = "ts",
          },
        },
      }
    end,
    dependencies = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "neovim/nvim-lspconfig" },
      { "ms-jpq/coq.thirdparty" },
      {
        "windwp/nvim-autopairs",
        config = true,
      },
    },
    config = function()
      require("coq_3p")({
        { src = "nvimlua", short_name = "api", conf_only = false }, -- Lua
        { src = "bc", short_name = "math", precision = 6 }, -- Calculator
        { src = "figlet", trigger = "!big" }, -- figlet command
        { src = "vim_dadbod_completion", short_name = "DB" },
        { src = "dap" },
        {
          src = "repl",
          sh = "zsh",
          shell = { p = "perl", n = "node" },
          max_lines = 99,
          deadline = 500,
          unsafe = { "rm", "poweroff", "mv" },
        },
      })
    end,
    lazy = false,
  },
}
