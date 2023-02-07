-- treesitter.lua
-- https://github.com/nvim-treesitter/nvim-treesitter
-- Highlight, edit, and navigate code

return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = "BufReadPost",
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    ---@type TSConfig
    opts = {
      highlight = { enable = true },
      indent = { enable = true, disable = { "python", "css" } },
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "css",
        "diff",
        "git_rebase",
        "gitcommit",
        "go",
        "help",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "python",
        "rasi",
        "rust",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        enable = true,
        swap = {
          enable = false,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]p"] = "@parameter.outer",
            ["]c"] = "@class.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]P"] = "@parameter.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[p"] = "@parameter.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[P"] = "@parameter.outer",
            ["[C"] = "@class.outer",
          },
        },
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",

            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",

            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",

            ["ad"] = "@conditional.outer",
            ["id"] = "@conditional.inner",

            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
