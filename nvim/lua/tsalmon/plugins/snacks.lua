return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        {"<leader>q", function() Snacks.bufdelete() end, desc = "Buffer delete", mode="n"},
        {"<leader>c", function() Snacks.explorer.reveal() end, desc = "Toggle Explorer", mode="n"}
    },
    opts = {
        bigfile = {
            enabled = true
        },
        bufdelete = {
            enabled = true
        },
        explorer = {
            enabled = true,
            replace_netrw = true
        },
        indent = {
            enabled = true
        },
        input = {
            enabled = true
        },
        picker = {
            enabled = true,
            hidden = true,
            ignored = true
        },
        notifier = {
            enabled = true
        },
        quickfile = {
            enabled = true
        },
        scope = {
            enabled = true
        },
        scroll = {
            enabled = true
        },
        statuscolumn = {
            enabled = true
        },
        words = {
            enabled = true
        },
    },
}
