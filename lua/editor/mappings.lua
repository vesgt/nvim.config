local map = vim.keymap.set
local wk = require("which-key")

local function has_lsp()
    return #vim.lsp.get_clients({ bufnr = 0 }) > 0
end

local function lsp_or_notify(action, message)
    return function()
        if not has_lsp() then
            vim.notify(message or "No LSP attached to this buffer", vim.log.levels.WARN, {
                title = "LSP",
            })
            return
        end

        action()
    end
end

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
    { "<leader>c", group = "Code" },
    { "<leader>e", group = "Explorer" },
    { "<leader>f", group = "FuzzyFinding" },
})

-- Leader keybindings

map("n", "<leader>ee", "<cmd>Neotree <cr>", { desc = "Opens the filesystem in neo-tree" })
map("n", "<leader>eb", "<cmd>Neotree buffers<cr>", { desc = "Opens current buffers in neo-tree" })

map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Opens fuzzy finder in cwd" })
map("n", "<leader>fU", function()
    require("fzf-lua").files({
        cwd = vim.fn.expand("~"),
    })
end, {
    desc = "Find files in home",
})
map("n", "<leader>fR", "<cmd>FzfLua resume<cr>", { desc = "Resume fuzzy finding where you left it" })

-- Buffer keybindings
map("n", "<leader>bd", function()
    require("mini.bufremove").delete(0, false)
end, {
    desc = "Delete buffer",
})
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save current buffer" })
map("n", "<leader>bS", "<cmd>wa<cr>", { desc = "Save all opened buffers" })
map("n", "<leader>bo", function()
    local current = vim.api.nvim_get_current_buf()

    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if bufnr ~= current and vim.api.nvim_buf_is_loaded(bufnr) then
            local buftype = vim.bo[bufnr].buftype

            if buftype == "" then
                require("mini.bufremove").delete(bufnr, false)
            end
        end
    end
end, {
    desc = "Delete other buffers",
})
map("n", "<leader>bO", function()
    local current = vim.api.nvim_get_current_buf()

    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if bufnr ~= current and vim.api.nvim_buf_is_loaded(bufnr) then
            local buftype = vim.bo[bufnr].buftype

            if buftype == "" then
                require("mini.bufremove").delete(bufnr, true)
            end
        end
    end
end, {
    desc = "Force delete other buffers",
})

-- Code Actions
map("n", "<leader>ca", lsp_or_notify(vim.lsp.buf.code_action, "No code actions available: no LSP attached"), {
    desc = "Code action",
})

map("v", "<leader>ca", lsp_or_notify(vim.lsp.buf.code_action, "No code actions available: no LSP attached"), {
    desc = "Code action",
})

map("n", "<leader>cr", lsp_or_notify(vim.lsp.buf.rename, "Cannot rename: no LSP attached"), {
    desc = "Rename symbol",
})

map("n", "<leader>cs", lsp_or_notify(vim.lsp.buf.document_symbol, "No document symbols: no LSP attached"), {
    desc = "Document symbols",
})

map("n", "<leader>cS", lsp_or_notify(vim.lsp.buf.workspace_symbol, "No workspace symbols: no LSP attached"), {
    desc = "Workspace symbols",
})

map("n", "<leader>cd", function()
    local diagnostics = vim.diagnostic.get(0)

    if #diagnostics == 0 then
        vim.notify("No diagnostics in this buffer", vim.log.levels.INFO, {
            title = "Diagnostics",
        })
        return
    end

    vim.diagnostic.open_float()
end, {
    desc = "Line diagnostic",
})

map("n", "<leader>cq", function()
    local diagnostics = vim.diagnostic.get(0)

    if #diagnostics == 0 then
        vim.notify("No diagnostics in this buffer", vim.log.levels.INFO, {
            title = "Diagnostics",
        })
        return
    end

    vim.diagnostic.setloclist()
end, {
    desc = "Diagnostics list",
})

map("n", "<leader>cf", function()
    require("conform").format({
        async = true,
        timeout_ms = 2500,
        lsp_format = "fallback",
    })
end, {
    desc = "Format file",
})

map("v", "<leader>cf", function()
    require("conform").format({
        async = true,
        timeout_ms = 2500,
        lsp_format = "fallback",
    })
end, {
    desc = "Format selection",
})

-- Quit
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit nvim completely" })

-- Non-leader keybindings

map("n", "<C-S-s>", "<cmd>wall <cr>", { desc = "Save all files" })
map("n", "<C-s>", "<cmd>w <cr>", { desc = "Save file" })
map("i", "<C-s>", "<esc><cmd> w<cr>", { desc = "Save file" })
map("i", "<C-S-s>", "<esc><cmd> wall<cr>", { desc = "Save all files" })

map("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

map("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
