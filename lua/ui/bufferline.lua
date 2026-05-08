local normal_bg = vim.api.nvim_get_hl(0, {
    name = "Normal",
}).bg

local bg = normal_bg and string.format("#%06x", normal_bg) or "NONE"

require("bufferline").setup({
    highlights = {
        fill = {
            bg = bg,
        },
        background = {
            bg = bg,
        },
        buffer_visible = {
            bg = bg,
        },
        buffer_selected = {
            bg = bg,
            bold = true,
            italic = false,
        },
        separator = {
            bg = bg,
        },
        separator_visible = {
            bg = bg,
        },
        separator_selected = {
            bg = bg,
        },
        tab = {
            bg = bg,
        },
        tab_selected = {
            bg = bg,
        },
        tab_separator = {
            bg = bg,
        },
        tab_separator_selected = {
            bg = bg,
        },
        indicator_selected = {
            bg = bg,
        },
        modified = {
            bg = bg,
        },
        modified_visible = {
            bg = bg,
        },
        modified_selected = {
            bg = bg,
        },
    },

    options = {
        mode = "buffers",
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,

        offsets = {
            {
                filetype = "neo-tree",
                text = "Explorer",
                text_align = "center",
                separator = false,
            },
        },
    },
})
