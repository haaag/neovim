-- [[ packer.nvim ]]

-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
  -- Package manager
  use({ "wbthomason/packer.nvim" })

  use({ -- theme
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        integrations = {
          navic = {
            enabled = true,
          },
          indent_blankline = {
            enabled = true,
          },
        },
      })
      -- load colorscheme
      vim.o.termguicolors = true
      vim.cmd("colorscheme catppuccin")
    end,
  })

  use({ -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Useful status updates for LSP
      {
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup({
            text = {
              spinner = "moon",
            },
            align = {
              bottom = true,
            },
            window = {
              relative = "editor",
            },
          })
        end,
      },
    },
  })

  use({ -- Autocompletion
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "rafamadriz/friendly-snippets",
      { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" },
    },
  })

  -- Speed up loading Lua modules in Neovim to improve startup time.
  use({ "lewis6991/impatient.nvim" })

  use({ -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    run = function() pcall(require("nvim-treesitter.install").update({ with_sync = true })) end,
  })

  use({ -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  -- Git related plugins
  use({ "tpope/vim-fugitive" })
  use({ "tpope/vim-rhubarb" })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▏" },
          change = { text = "▏" },
          changedelete = { text = "▏" },
        },
      })
    end,
  })

  -- Fancier statusline
  use({ "nvim-lualine/lualine.nvim" })

  use({ -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        use_treesitter = true,
        show_trailing_blankline_indent = false,
        char = "▏",
        context_char = "▏",
        show_current_context = true,
        show_current_context_start = false,
        show_end_of_line = false,
        space_char_blankline = " ",
      })
    end,
  })

  use({ "lukas-reineke/lsp-format.nvim" })

  use({ -- "gc" to comment visual regions/lines
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
  })

  -- Detect tabstop and shiftwidth automatically
  use({ "tpope/vim-sleuth" })

  -- Fuzzy Finder (files, lsp, etc)
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

  -- Better profiling output for startup
  use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

  -- devicons
  use({ "kyazdani42/nvim-web-devicons" })

  -- better python indentation
  use({ "Vimjas/vim-python-pep8-indent", ft = { "py", "python" } })

  -- toggle terminal
  use({ "akinsho/toggleterm.nvim" })

  use({ -- lead for search
    "ggandor/leap.nvim",
    config = function() require("leap").add_default_mappings() end,
  })

  use({ -- winbar
    "utilyre/barbecue.nvim",
    requires = {
      "smiteshp/nvim-navic",
    },
    config = function()
      require("barbecue").setup({
        show_modified = false,
        symbols = {
          separator = ">",
        },
      })
    end,
  })

  -- file explorer
  use({
    "prichrd/netrw.nvim",
    config = function()
      require("netrw").setup({
        icons = {
          symlink = "",
          directory = "",
          file = "",
        },
        use_devicons = true,
      })
    end,
  })

  use({ -- vista
    "liuchengxu/vista.vim",
    config = function()
      local g = vim.g
      g.vista_sidebar_width = 40
      vim.keymap.set("n", "<F2>", "<CMD>Vista!!<CR>", { desc = "Vista toggle" })
    end,
  })

  --[[ use({ -- project's root directory
    "Abstract-IDE/penvim",
    config = function() require("penvim").setup() end,
  }) ]]

  use({ -- A pretty list for diagnostics
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup({}) end,
    cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" },
  })

  --[[ use({
    "folke/todo-comments.nvim",
    config = function() require("todo-comments").setup({}) end,
  }) ]]

  if is_bootstrap then require("packer").sync() end
end)

if is_bootstrap then
  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
  return
end
