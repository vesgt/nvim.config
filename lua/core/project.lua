require("project_nvim").setup({
    detection_methods = { "lsp", "pattern" },

    patterns = {
        ".git",
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        "*.sln",
        "*.csproj",
    },

    exclude_dirs = {
        "~/Downloads/*",
    },
})
