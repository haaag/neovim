-- treesitter.lua
-- https://github.com/nvim-treesitter/nvim-treesitter
-- Highlight, edit, and navigate code

return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    enabled = true,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      highlight = {
        enable = true,
        -- disable = { "python" },
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = false,
        disable = { "python", "css" },
      },
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "css",
        "diff",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "help",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
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
        enable = false,
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
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
