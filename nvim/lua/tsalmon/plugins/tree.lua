return {
    "nvim-tree/nvim-tree.lua",
    requires = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 50,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
        })
        vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)
        vim.keymap.set("n", "<leader>c", vim.cmd.NvimTreeCollapse)
        vim.keymap.set("n", "<leader>g", vim.cmd.NvimTreeFindFile)
    end
}
