local cmp = require("blink.cmp")
cmp.build()
cmp.setup({
    keymap = {
        preset = 'default'
    },

    appearance = {
        nerd_font_variant = 'mono'
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 400
        }
    },

    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer"
        }
    }
})

