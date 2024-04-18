return {
    "nvim-lualine/lualine.nvim",
    requires = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        options = {
            icons_enabled = true,
            component_separators = "|",
            section_separators = "",
            disabled_filetypes = {
                statusline = { "packer", "NvimTree" },
                winbar = { "packer", "NvimTree" }
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
    },
    config = function()
        vim.cmd([[colorscheme vscode]])
    end,
}
