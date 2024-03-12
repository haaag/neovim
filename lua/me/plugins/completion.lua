return { -- https://github.com/ms-jpq/coq_nvim
  'ms-jpq/coq_nvim',
  branch = 'coq',
  build = 'python -m coq deps',
  init = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up',
      keymap = {
        pre_select = false,
        manual_complete_insertion_only = false,
        jump_to_mark = '<c-k>',
      },
      clients = {
        tags = { enabled = true },
        tmux = { enabled = true },
        buffers = { same_filetype = true },
        paths = { preview_lines = 3 },
        lsp = { enabled = true },
        snippets = { enabled = true },
        tree_sitter = { always_on_top = false, enabled = true },
      },
      limits = { completion_auto_timeout = 0.2 },
    }
  end,
  dependencies = { -- https://github.com/ms-jpq/coq.thirdparty
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
    {
      'ms-jpq/coq.thirdparty',
      branch = '3p',
      config = function()
        require('coq_3p')({
          { src = 'nvimlua', short_name = 'api', conf_only = true }, -- Lua
          { src = 'bc', short_name = 'math', precision = 6 }, -- Calculator
          { src = 'codeium', short_name = 'cod', accept_key = '<c-g>' },
          { src = 'cow', trigger = '!cow' },
          {
            src = 'figlet',
            trigger = '!big',
            short_name = 'BIG',
            fonts = { '/usr/share/figlet/standard.flf' },
          },
          -- { src = "vim_dadbod_completion", short_name = "DB" },
          -- { src = "dap" },
          {
            src = 'repl',
            sh = 'zsh',
            shell = { p = 'perl', n = 'node' },
            max_lines = 99,
            deadline = 500,
            unsafe = { 'rm', 'poweroff', 'mv' },
          },
        })
      end,
    },
  },
  enabled = true,
}
