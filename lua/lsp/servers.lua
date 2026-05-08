vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config("ts_ls", {
    root_markers = {
        "tsconfig.json",
        "jsconfig.json",
        "package.json",
        ".git",
    },
})

vim.lsp.config("eslint", {
    root_markers = {
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
        ".eslintrc",
        ".eslintrc.json",
        ".eslintrc.js",
        "package.json",
        ".git",
    },
})

vim.lsp.config("tailwindcss", {
    filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },

    root_markers = {
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.cjs",
        "postcss.config.mjs",
        "package.json",
        ".git",
    },
})

vim.lsp.config("jsonls", {
    filetypes = {
        "json",
        "jsonc",
    },
})

vim.lsp.enable({
    "lua_ls",

    "ts_ls",
    "eslint",
    "tailwindcss",
    "html",
    "cssls",
    "jsonls",
    "yamlls",
})
