return {

  { -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons',
    enabled = true,
  },

  { -- https://github.com/tzachar/local-highlight.nvim
    'tzachar/local-highlight.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>bh', '<CMD>LocalHighlightToggle<CR>', desc = 'highlight word toggle' },
    },
    config = function()
      vim.api.nvim_set_hl(0, 'MyLocalHighlight', {
        underline = true,
        bold = true,
      })
      require('local-highlight').setup({
        hlgroup = 'MyLocalHighlight',
      })
    end,
    enabled = true,
  },

  { -- my.statusline.nvim
    dir = tostring(os.getenv('HOME')) .. '/dev/lua/stat.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
    event = 'VeryLazy',
    config = true,
    enabled = true,
  },

  { -- https://github.com/akinsho/bufferline.nvim
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    dependencies = { -- https://github.com/tiagovla/scope.nvim
      'tiagovla/scope.nvim',
      opts = {},
    },
    opts = {
      options = {
        buffer_close_icon = ' ',
        modified_icon = '',
      },
    },
    enabled = true,
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
      { '<leader>bc', '<CMD>ColorizerToggle<CR>', desc = 'colorizer' },
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

  { -- https://github.com/folke/which-key.nvim
    'folke/which-key.nvim',
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
      wk.register({
        mode = { 'n', 'v' },
        ['g'] = { name = '+goto' },
        [']'] = { name = '+next' },
        ['['] = { name = '+prev' },
        ['<leader>b'] = { name = '+buffers' },
        ['<leader>d'] = { name = '+debugging' },
        ['<leader>dp'] = { name = '+python' },
        ['<leader>ds'] = { name = '+step' },
        ['<leader>e'] = { name = '+edits' },
        ['<leader>g'] = { name = '+git' },
        ['<leader>gt'] = { name = '+telescope' },
        ['<leader>gd'] = { name = '+diff' },
        ['<leader>gh'] = { name = '+hunks' },
        ['<leader>l'] = { name = '+lsp' },
        ['<leader>lw'] = { name = '+workspace' },
        ['<leader>m'] = { name = '+misc' },
        ['<leader>s'] = { name = '+search' },
        ['<leader>t'] = { name = '+test' },
        ['<leader>q'] = { name = '+quickfix' },
        ['<leader>qs'] = { name = '+sessions' },
        ['<leader>x'] = { name = '+diagnostics' },
      })
    end,
    enabled = true,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
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
        },
      },
    },
    main = 'ibl',
  },

  -- Active indent guide and indent text objects. When you're browsing
  -- code, this highlights the current level of indentation, and animates
  -- the highlighting.
  {
    'echasnovski/mini.indentscope',
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = 'VeryLazy',
    opts = {
      -- symbol = "▏",
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
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
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
