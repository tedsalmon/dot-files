require('lualine').setup {
    options = {
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
            statusline = { 'packer', 'NvimTree' },
            winbar = { 'packer', 'NvimTree' }
        }
    },
    sections = {
        lualine_x = {
            {
                color = { fg = "#ff9e64" },
            }
        },
        lualine_a = {
            {
                'buffers',
            }
        },
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1
            }
        }
    }
}
