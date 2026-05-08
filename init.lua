vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")

require("plugins")

require("ui.theme")
require("ui.highlights")

require("editor.mappings")

require("ui.lualine")
require("ui.bufferline")
require("ui.neotree")
require("ui.dashboard")
require("ui.noice")
require("ui.snacks")

require("editor.completion")
require("editor.formatting")
require("editor.project")
require("editor.bufremove")

require("lsp")
