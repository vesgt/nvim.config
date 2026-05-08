local map = vim.keymap.set
local wk = require("which-key")

wk.setup({
    preset = "helix",
    delay = 300,
    icons = { mappings = true, rules = false },

    win = {
        border = "rounded",
        padding = { 1, 2 },
        title = true,
        title_pos = "center",
        row = -3,
        col = -1,
        wo = { winblend = 0 },
    },

    layout = {
        width = { min = 32, max = 32 },
        height = { min = 12, max = 24 },
        spacing = 1,
        align = "left",
    },

    show_help = true,
    show_keys = true,
})

wk.add({
    { "<leader>b", group = "Buffers" },
    { "<leader>e", group = "Explorer" },
    { "<leader>f", group = "FzfLua" },
    { "<leader>c", group = "Code" },
    { "<C-S-s>", group = "Save all files" },
    { "<C-s>", group = "Save current file" },
})

-- Leader keybindings

map("n", "<leader>ee", "<cmd>Neotree <cr>", { desc = "Opens the filesystem in neo-tree" })
map("n", "<leader>eb", "<cmd>Neotree buffers<cr>", { desc = "Opens current buffers in neo-tree" })

map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Opens fuzzy finder" })
map("n", "<leader>fR", "<cmd>FzfLua resume<cr>", { desc = "Resume fuzzy finding where you left it" })

vim.keymap.set("n", "<leader>bd", function()
    require("mini.bufremove").delete(0, false)
end, {
    desc = "Delete buffer",
})
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save current buffer" })
map("n", "<leader>bS", "<cmd>wa<cr>", { desc = "Save all opened buffers" })

map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit nvim completely" })

-- Non-leader keybindings

map("n", "<C-S-s>", "<cmd>wall <cr>", { desc = "Save all files" })
map("n", "<C-s>", "<cmd>w <cr>", { desc = "Save file" })

map("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

map("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
