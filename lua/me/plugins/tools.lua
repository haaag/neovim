return {

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
    event = { "BufRead", "BufNewFile" },
    build = "deno task --quiet build:fast",
    ft = { "markdown" },
    config = function()
      require("peek").setup({
        -- theme = "dark", -- 'dark'
        theme = "light", -- 'dark'
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

  -- makes some plugins dot-repeatable like leap
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
    enabled = true,
  },

  { -- https://github.com/numToStr/Comment.nvim
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
    enabled = true,
  },

  { -- https://github.com/Abstract-IDE/penvim
    "Abstract-IDE/penvim",
    event = "VeryLazy",
    config = true,
    enabled = true,
  },

  --[[ { -- https://github.com/Exafunction/codeium.vim
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    config = function()
      vim.g.codeium_enabled = true
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
    enabled = true,
  }, ]]

  { -- https://github.com/echasnovski/mini.bufremove
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "[B]uffer [d]elete" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "[B]uffer [D]elete (Force)" },
    },
    enabled = true,
  },

  { -- https://github.com/neo-tree.nvim
    "nvim-neo-tree/neo-tree.nvim",
    cmd = { "Neotree", "NeoTreeRevealToggle" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader><F3>", "<CMD>Neotree current %:p:h:h %:p<CR>", desc = "NeoTree Current" },
      { "<F3>", "<CMD>Neotree toggle<CR>", desc = "NeoTree Toggle" },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        position = "right",
        width = 50,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = false,
          },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["o"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["a"] = "add",
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination
          ["m"] = "move", -- takes text input for destination
          ["q"] = "close_window",
          ["R"] = "refresh",
        },
      },
    },
  },
}
