local logo = [[
███╗   ██╗██╗   ██╗██╗███╗   ███╗
████╗  ██║██║   ██║██║████╗ ████║
██╔██╗ ██║██║   ██║██║██╔████╔██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

require("dashboard").setup({
    theme = "doom",

    config = {
        header = vim.split(logo, "\n"),

        center = {
            {
                icon = "󰈞  ",
                icon_hl = "DashboardIcon",
                desc = "Find file",
                desc_hl = "DashboardDesc",
                key = "f",
                key_hl = "DashboardKey",
                key_format = " [%s]",
                action = "FzfLua files",
            },
            {
                icon = "󰱼  ",
                icon_hl = "DashboardIcon",
                desc = "Live grep",
                desc_hl = "DashboardDesc",
                key = "g",
                key_hl = "DashboardKey",
                key_format = " [%s]",
                action = "FzfLua live_grep",
            },
            {
                icon = "󰈙  ",
                icon_hl = "DashboardIcon",
                desc = "Recent files",
                desc_hl = "DashboardDesc",
                key = "r",
                key_hl = "DashboardKey",
                key_format = " [%s]",
                action = "FzfLua oldfiles",
            },
            {
                icon = "󰉋  ",
                icon_hl = "DashboardIcon",
                desc = "Projects",
                desc_hl = "DashboardDesc",
                key = "p",
                key_hl = "DashboardKey",
                key_format = " [%s]",
                action = function()
                    local history = require("project_nvim.utils.history")
                    local projects = history.get_recent_projects()

                    require("fzf-lua").fzf_exec(projects, {
                        prompt = "Projects> ",
                        actions = {
                            ["default"] = function(selected)
                                local path = selected[1]

                                if not path or path == "" then
                                    return
                                end

                                path = vim.fn.fnamemodify(path, ":p")
                                vim.cmd("cd " .. vim.fn.fnameescape(path))

                                vim.cmd("enew")
                                vim.bo.buftype = "nofile"
                                vim.bo.bufhidden = "wipe"
                                vim.bo.swapfile = false

                                vim.cmd("Neotree filesystem reveal left dir=" .. vim.fn.fnameescape(path))
                            end,
                        },
                    })
                end,
            },
            {
                icon = "  ",
                icon_hl = "DashboardIcon",
                desc = "Config",
                desc_hl = "DashboardDesc",
                key = "c",
                key_hl = "DashboardKey",
                key_format = " [%s]",
                action = "edit ~/.config/nvim/init.lua",
            },
            {
                icon = "󰗼  ",
                icon_hl = "DashboardIcon",
                desc = "Quit",
                desc_hl = "DashboardDesc",
                key = "q",
                key_hl = "DashboardKey",
                key_format = " [%s]",
                action = "qa",
            },
        },

        footer = {
            "",
            "Next.js • C# • Neovim",
        },

        vertical_center = true,
    },
})
