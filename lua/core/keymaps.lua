local map = vim.keymap.set

map("n", "<leader>ne", "<cmd>Neotree <cr>", { desc = "Opens the filesystem in neo-tree" })
map("n", "<leader>nb", "<cmd>Neotree buffers<cr>", { desc = "Opens current buffers in neo-tree" })

map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Opens fuzzy finder" })
map("n", "<leader>fR", "<cmd>FzfLua resume<cr>", { desc = "Resume fuzzy finding where you left it" })

vim.keymap.set("n", "<leader>bd", function()
    require("mini.bufremove").delete(0, false)
end, {
    desc = "Delete buffer",
})
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

map("n", "<leader>sc", "<cmd>w<cr>", { desc = "Save current buffer" })
map("n", "<leader>sa", "<cmd>wa<cr>", { desc = "Save all opened buffers" })
