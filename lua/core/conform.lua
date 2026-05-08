require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },

        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },

        html = { "prettier" },

        json = { "prettier" },
        jsonc = { "prettier" },

        yaml = { "prettier" },
        yml = { "prettier" },

        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },

        graphql = { "prettier" },

        cs = { "csharpier" },

        xml = { "xmllint" },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
    },

    format_on_save = function(bufnr)
        local disabled_filetypes = {
            c = true,
            cpp = true,
        }

        if disabled_filetypes[vim.bo[bufnr].filetype] then
            return
        end

        return {
            timeout_ms = 2500,
            lsp_format = "fallback",
        }
    end,

    formatters = {
        prettier = {
            prepend_args = {
                "--tab-width",
                "4",
            },
        },

        csharpier = {
            command = "dotnet",
            args = {
                "csharpier",
                "format",
                "$FILENAME",
            },
            stdin = false,
        },
    },
})
