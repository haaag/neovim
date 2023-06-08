return {

  { -- https://github.com/echasnovski/mini.surround
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
        auto_start = "shut-up",
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
          tabnine = { enabled = true, short_name = "t9" },
          tmux = { enabled = true, short_name = "tmux" },
          buffers = { same_filetype = true, short_name = "buf" },
          paths = { preview_lines = 3, short_name = "path" },
          lsp = { enabled = true, short_name = "lsp" },
          snippets = { enabled = true, short_name = "snip" },
          tree_sitter = {
            always_on_top = false,
            enabled = true,
            short_name = "ts",
          },
        },
      }
    end,
    dependencies = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p" },
    },
    config = function()
      -- https://github.com/ms-jpq/coq.thirdparty
      require("coq_3p")({
        { src = "nvimlua", short_name = "api", conf_only = true }, -- Lua
        { src = "bc", short_name = "math", precision = 6 }, -- Calculator
        { src = "vim_dadbod_completion", short_name = "DB" },
        { src = "cow", trigger = "!cow" },
        { -- figlet command
          src = "figlet",
          trigger = "!big",
          short_name = "BIG",
          fonts = {
            "/usr/share/figlet/standard.flf",
            "/usr/share/figlet/cybermedium.flf",
          },
        },
        -- { src = "dap" },
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
