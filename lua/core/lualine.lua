local function clock()
    return os.date("%H:%M")
end

require("lualine").setup({
    options = {
        theme = "nightfly",
        globalstatus = true,
        icons_enabled = true,
        section_separators = { left = " |", right = "| " },
        component_separators = { left = " |", right = "| " },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "pretty_path" },
        lualine_x = { "encoding" },
        lualine_y = { "location" },
        lualine_z = { clock },
    },
})
