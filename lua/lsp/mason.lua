require("mason").setup({
    ui = {
        border = "rounded",
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",

        -- Next.js / frontend
        "ts_ls",
        "eslint",
        "tailwindcss",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
    },

    automatic_enable = false,
})
