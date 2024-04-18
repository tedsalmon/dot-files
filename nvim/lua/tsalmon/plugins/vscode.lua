return {
    "Mofiqul/vscode.nvim",
    config = function()
        local c = require("vscode.colors").get_colors()
        require("vscode").setup({
            transparent = true,
            italic_comments = true,
            disable_nvimtree_bg = true,
            color_overrides = {
                vscLineNumber = "#FFFFFF",
            },
            group_overrides = {
                Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
            }
        })
    end,
}
