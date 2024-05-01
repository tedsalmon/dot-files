return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                component_separators = "|",
                section_separators = "",
                disabled_filetypes = {
                    statusline = { "NvimTree" },
                    winbar = { "NvimTree" }
                },
                theme = "vscode"
            },
            sections = {
                lualine_x = {
                    {
                        color = { fg = "#FF9E64" },
                    }
                },
                lualine_a = {
                    {
                        "buffers",
                    }
                },
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 1
                    }
                }
            }
        }
    end,
}
