return {
  { -- https://github.com/matbme/JABS.nvim
    "matbme/JABS.nvim",
    opts = {
      position = { "center", "center" },
      relative = "editor",
    },
    keys = {
      { "<leader><leader><space>", "<CMD>JABSOpen<CR>", desc = "[ ] Find existing buffers" },
    },
    enabled = true,
  },

  { -- https://github.com/baskerville/vim-sxhkdrc
    "baskerville/vim-sxhkdrc",
    ft = { "sxhkdrc" },
    enabled = true,
  },

  { -- https://github.com/Vimjas/vim-python-pep8-indent
    "Vimjas/vim-python-pep8-indent",
    ft = { "py", "python" },
    enabled = true,
  },

  { -- https://github.com/echasnovski/mini.bufremove
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "[B]uffer [d]elete" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "[B]uffer [D]elete (Force)" },
    },
    enabled = true,
  },

  -- profiling
  { -- https://github.com/dstein64/vim-startuptime
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
    enabled = true,
  },

  -- colorizer.lua
  { -- https://github.com/NvChad/nvim-colorizer.lua
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile", "!TelescopePrompt" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
    enabled = true,
  },

  -- markdown preview
  { -- https://github.com/toppair/peek.nvim
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    ft = { "markdown" },
    config = function()
      require("peek").setup({
        theme = "dark", -- 'dark'
        -- theme = "light", -- 'dark'
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    keys = {
      { "<leader>mp", "<CMD>PeekOpen<CR>", desc = "Peek Open" },
      { "<leader>mP", "<CMD>PeekClose<CR>", desc = "Peek Close" },
    },
    enabled = true,
  },
}
