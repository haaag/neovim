local neocodeium_started = false

return {

  { -- https://github.com/stevearc/aerial.nvim
    'stevearc/aerial.nvim',
    opts = { show_guides = true },
    keys = {
      { '<F2>', '<CMD>AerialToggle<CR>', desc = 'aerial toggle' },
      { '[f', '<CMD>AerialPrev<CR>', desc = 'aerial prev' },
      { ']f', '<CMD>AerialNext<CR>', desc = 'aerial next' },
    },
  },

  { -- https://github.com/monkoose/neocodeium
    'monkoose/neocodeium',
    cmd = 'NeoCodeium',
    keys = {
      {
        '<leader>lS',
        function()
          if not neocodeium_started then
            Core.notify('neocodeium started')
            vim.cmd('NeoCodeium enable')
            neocodeium_started = true
          else
            Core.notify('neocodeium already started')
          end
        end,
        desc = 'neocodeium start',
      },
    },
    config = function()
      local map = vim.keymap.set
      local nc = require('neocodeium')
      nc.setup({ enabled = false })

      map('i', '<C-g>', nc.accept)
      map('i', '<M-;>', nc.cycle_or_complete)
    end,
  },

  { -- https://github.com/folke/lazydev.nvim
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    cmd = 'LazyDev',
    enabled = true,
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        { path = 'Core', words = { 'Core' } },
      },
    },
  },
}
