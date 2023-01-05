-- indent blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  config = {
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "neo-tree",
      "Trouble",
    },
    -- char = "│",
    char = "▏",
    use_treesitter_scope = false,
    show_trailing_blankline_indent = false,
    show_current_context = true,
    context_patterns = {
      "class",
      "return",
      "function",
      "method",
      "^if",
      "^while",
      "jsx_element",
      "^for",
      "^object",
      "^table",
      "block",
      "arguments",
      "if_statement",
      "else_clause",
      "jsx_element",
      "jsx_self_closing_element",
      "try_statement",
      "catch_clause",
      "import_statement",
      "operation_type",
    },
  },
}

return M