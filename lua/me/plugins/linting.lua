return {
  { -- https://github.com/mfussenegger/nvim-lint
    'mfussenegger/nvim-lint',
    enabled = true,
    event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    config = function()
      local augroup = require('me.config.utils').augroup
      local autocmd = vim.api.nvim_create_autocmd
      local lint = require('lint')

      lint.linters.shellcheck.args = {
        '--format',
        'json',
        '--rcfile',
        os.getenv('HOME') .. '/.dotfiles/shellcheck/shellcheckrc',
        '-',
      }

      lint.linters_by_ft = {
        ['*'] = { 'codespell', 'misspell', 'typos' },
        ['c'] = { 'cpplint' },
        ['go'] = { 'golangcilint' }, -- 'revive' },
        ['javascript'] = { 'eslint_d' },
        ['javascriptreact'] = { 'eslint_d' },
        ['markdown'] = { 'markdownlint', 'write_good', 'alex' },
        ['make'] = { 'checkmake' },
        ['python'] = { 'mypy' },
        ['sh'] = { 'shellcheck' },
        ['typescript'] = { 'eslint_d' },
        ['typescriptreact'] = { 'eslint_d' },
      }

      autocmd({ 'InsertLeave', 'BufWritePost' }, {
        group = augroup('lint'),
        callback = function()
          lint.try_lint()
        end,
        desc = 'lint code via nvim-lint',
      })

      vim.keymap.set('n', '<leader>ll', function()
        lint.try_lint()
      end, { desc = 'trigger linting for current file' })
    end,
  },
}
