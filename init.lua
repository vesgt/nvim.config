vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.lualine")
require("core.neotree")
require("core.blink")
require("core.project")
require("core.dashboard")
require("core.theme")
require("core.highlights")
require("core.conform")
require("core.snacks")
require("core.noice")
require("core.bufferline")
require("core.mini-buffremove")
