-- me.plugins.linting

local autocmd = vim.api.nvim_create_autocmd
local shell_path = Core.env.xdg_home() .. '/dot/shellcheck/shellcheckrc'
if not Core.file_exist(shell_path) then
  Core.warnme('linting: shellcheckrc not found\n')
end

local shellcheckrc = {
  '--format',
  'json',
  '--rcfile',
  shell_path,
  '-',
}

return {
  { -- https://github.com/mfussenegger/nvim-lint
    'mfussenegger/nvim-lint',
    enabled = true,
    event = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    config = function()
      local lint = require('lint')
      lint.linters.shellcheck.args = shellcheckrc
      lint.linters_by_ft = {
        ['*'] = { 'codespell', 'misspell', 'typos' },
        -- ['c'] = { 'cpplint' },
        -- ['gitcommit'] = { 'commitlint' },
        ['go'] = { 'golangcilint' },
        ['javascript'] = { 'eslint_d' },
        ['javascriptreact'] = { 'eslint_d' },
        ['make'] = { 'checkmake' },
        ['markdown'] = { 'markdownlint', 'write_good', 'alex' },
        ['python'] = { 'mypy' },
        ['sh'] = { 'shellcheck' },
        ['typescript'] = { 'eslint_d' },
        ['typescriptreact'] = { 'eslint_d' },
      }

      autocmd({ 'InsertLeave', 'BufWritePost' }, {
        group = Core.augroup('lint'),
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
