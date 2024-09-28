return {

  { -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons',
    enabled = true,
  },

  { -- https://github.com/tzachar/local-highlight.nvim
    'tzachar/local-highlight.nvim',
    keys = {
      { '<leader>bw', '<CMD>LocalHighlightToggle<CR>', desc = 'toggle highlight word' },
    },
    config = function()
      vim.api.nvim_set_hl(0, 'MyLocalHighlight', { underline = true, bold = true })
      require('local-highlight').setup({
        hlgroup = 'MyLocalHighlight',
        cw_hlgroup = nil,
        insert_mode = false,
        min_match_len = 1,
        max_match_len = math.huge,
      })
    end,
    enabled = true,
  },

  { -- my.statusline.nvim
    dir = '~/dev/lua/stat.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
    event = 'VeryLazy',
    lazy = false,
    enabled = true,
  },

  { -- https://github.com/akinsho/bufferline.nvim
    'akinsho/bufferline.nvim',
    after = 'gruvbox',
    event = 'VeryLazy',
    enabled = true,
    dependencies = { -- https://github.com/tiagovla/scope.nvim
      'tiagovla/scope.nvim',
      config = true,
      enabled = true,
    },
    opts = function()
      local bufferline = require('bufferline')
      return {
        options = {
          style_preset = bufferline.style_preset.minimal,
          always_show_bufferline = false,
          show_buffer_close_icons = false,
          modified_icon = '',
          indicator = {
            icon = '▏',
            style = 'icon',
          },
        },
      }
    end,
  },

  { -- https://github.com/NvChad/nvim-colorizer.lua
    'NvChad/nvim-colorizer.lua',
    cmd = {
      'ColorizerAttachToBuffer',
      'ColorizerDetachFromBuffer',
      'ColorizerReloadAllBuffers',
      'ColorizerToggle',
    },
    keys = {
      { '<leader>bc', '<CMD>ColorizerToggle<CR>', desc = 'toggle colorizer' },
    },
    opts = {
      filetypes = { '*', '!lazy' },
      buftype = { '*', '!prompt', '!nofile', '!TelescopePrompt' },
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
        mode = 'background', -- Set the display mode.
        virtualtext = '■',
      },
    },
    enabled = true,
  },

  --[[ { -- https://github.com/lukas-reineke/indent-blankline.nvim
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    enabled = true,
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
          'oil_preview',
        },
      },
    },
    main = 'ibl',
  },

  { -- https://github.com/echasnovski/mini.indentscope
    'echasnovski/mini.indentscope',
    version = false, -- wait till new 0.7.0 release to put it back on semver
    enabled = true,
    event = 'VeryLazy',
    opts = {
      -- symbol = "▏",
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'alpha',
          'dashboard',
          'help',
          'lazy',
          'lazyterm',
          'mason',
          'notify',
          'oil',
          'toggleterm',
          'Trouble',
          'trouble',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  }, ]]

  { -- https://github.com/echasnovski/mini.clue
    'echasnovski/mini.clue',
    version = false,
    event = 'VeryLazy',
    config = function()
      local miniclue = require('mini.clue')
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },

          -- `[ ]` keys
          { mode = 'n', keys = ']' },
          { mode = 'x', keys = ']' },
          { mode = 'n', keys = '[' },
          { mode = 'x', keys = '[' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),

          { mode = 'n', keys = '<Leader>b', desc = '+buffers' },
          { mode = 'n', keys = '<Leader>m', desc = '+misc' },
          { mode = 'n', keys = '<Leader>lw', desc = '+workspace' },
        },
      })
    end,
  },
}
