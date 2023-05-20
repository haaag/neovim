return {

  { -- https://github.com/kylechui/nvim-surround
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
    enabled = true,
  },

  -- {
  --   "echasnovski/mini.pairs",
  --   event = "VeryLazy",
  --   config = function(_, opts)
  --     require("mini.pairs").setup(opts)
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = true,
  -- },

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
