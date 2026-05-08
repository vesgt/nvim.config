local function file_exists(path)
    return vim.uv.fs_stat(vim.fn.expand(path)) ~= nil
end

local is_omarchy = file_exists("~/.config/omarchy/current/theme")

if is_omarchy then
    local ok, loader = pcall(require, "omarchy-theme-loader")

    if ok then
        loader.setup({
            themes = {
                -- Add/adjust mappings as needed depending on your Omarchy themes.
                ["catppuccin"] = {
                    colorscheme = "catppuccin",
                },
                ["tokyo-night"] = {
                    colorscheme = "tokyonight",
                },
                ["tokyonight"] = {
                    colorscheme = "tokyonight",
                },
                ["gruvbox"] = {
                    colorscheme = "gruvbox",
                },
            },
        })

        return
    end
end

local fallbacks = {
    "tokyonight-moon",
    "catppuccin-mocha",
    "habamax",
}

for _, colorscheme in ipairs(fallbacks) do
    local ok = pcall(vim.cmd.colorscheme, colorscheme)

    if ok then
        break
    end
end
