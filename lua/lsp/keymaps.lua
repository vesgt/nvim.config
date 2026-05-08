vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local bufmap = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = event.buf,
                desc = desc,
            })
        end

        bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
        bufmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        bufmap("n", "gr", vim.lsp.buf.references, "References")
        bufmap("n", "gi", vim.lsp.buf.implementation, "Implementation")
        bufmap("n", "K", vim.lsp.buf.hover, "Hover")
    end,
})
