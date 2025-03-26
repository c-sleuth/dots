vim.g.mapleader = ' '
vim.g.mapleaderlocal = ","
vim.cmd 'colorscheme mellow'

require("keymaps")
require("opts")
require("telescope")
require("lsp")
require("autocomplete")
require("treesitter")
require("mini")
