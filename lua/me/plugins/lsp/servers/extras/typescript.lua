return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      "folke/which-key.nvim",
    },
    opts = {
      servers = {
        tsserver = {},
      },
      setup = {
        tsserver = function(_, opts)
          local wk = require("which-key")
          wk.register({
            mode = { "n", "v" },
            ["<leader>lt"] = { name = "+typescript" },
          })
          require("me.plugins.lsp.utils").on_attach(function(client, buffer)
              -- stylua: ignore
            if client.name == "tsserver" then
              -- luacheck: ignore
              vim.keymap.set("n", "<leader>lto", "TypescriptOrganizeImports", { buffer = buffer, desc = "[T]ypescript [O]rganize Imports" })
              vim.keymap.set("n", "<leader>ltr", "TypescriptRenameFile", { desc = "[T]ypescript [R]ename File", buffer = buffer })
              vim.keymap.set("n", "<leader>ltf", "<CMD>TypescriptFixAll<CR>", { desc = "[T]ypescript [F]ix All", buffer = buffer })
              vim.keymap.set("n", "<leader>ltR", "<CMD>TypescriptRemoveUnused<CR>", { desc = "[T]ypescript [R]emove Unused", buffer = buffer })
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}
