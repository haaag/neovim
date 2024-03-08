-- lsp.servers.pylsp
return {
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
    opts = {
      servers = {
        pylsp = {
          autostart = false,
          settings = {
            pylsp = {
              plugins = {
                -- disabled
                pylint = { enabled = false, executable = 'pylint' },
                autopep8 = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                flake8 = { enabled = false },
                yapf = { enabled = false },
                mccabe = { enabled = false },
                ruff = { enabled = false },
                pylsp_mypy = { enabled = false, dmypy = true, report_progress = true },
                black = { enabled = false },
                -- enabled
                rope_autoimport = { enabled = true },
                jedi_completion = {
                  enabled = true,
                  fuzzy = true,
                  include_params = true,
                  include_class_objects = true,
                  include_function_objects = true,
                },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true, all_scopes = true },
              },
            },
          },
        },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'ninja', 'python', 'rst', 'toml' })
      end
    end,
  },
}
