-- [[ init.lua ]]

require("me.packer")
require("me.settings")
require("me.autocmd")
require("me.nmaps")
require("me.lsp")
require("me.configs.treesitter")
require('fidget').setup()
require("me.configs.telescope")
require("me.configs.cmp")
require("me.configs.terminal")
require("me.configs.lualine")

-- vim: ts=2 sts=2 sw=2 et
