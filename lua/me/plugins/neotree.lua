-- neo-tree
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader><F3>", "<CMD>Neotree current %:p:h:h %:p<CR>", desc = "NeoTree" },
    { "<F3>", "<CMD>NeoTreeRevealToggle<CR>", desc = "NeoTree Reveal" },
  },
  enabled = true,
}

function M.config()
  local neotree = require("neo-tree")
  neotree.setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        with_markers = true,
        highlight = "NeoTreeIndentMarker",
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        default = "*",
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          -- Change type
          added = "✚",
          -- modified = icons.git.modified,
          deleted = "✖",
          renamed = "➜",
          -- Status type
          untracked = "✭",
          ignored = "☒",
          unstaged = "",
          staged = "✚",
          conflict = "",
        },
      },
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
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
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
    nesting_rules = {},
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
          "venv",
          ".venv",
          ".env",
        },
      },
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = false,
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
        },
      },
    },
    buffers = {
      show_unloaded = true,
      window = {
        mappings = {
          ["bd"] = "buffer_delete",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
        },
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        },
      },
    },
  })
end

return M
