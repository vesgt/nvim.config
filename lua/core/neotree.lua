require("neo-tree").setup({
    filesystem = {
        follow_current_file = {
            enabled = true,
        },
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
    },

    window = {
        position = "left",
        width = 46,

        mappings = {
            ["<left>"] = "noop",
            ["<right>"] = "noop",
            ["zh"] = "noop",
            ["zl"] = "noop",
            ["zH"] = "noop",
            ["zL"] = "noop",
        },
    },

    default_component_configs = {
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
    },
})
