return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "css",
                "dockerfile",
                "gitignore",
                "html",
                "javascript",
                "lua",
                "php",
                "python",
                "query",
                "rust",
                "tsx",
                "vim",
                "vimdoc"
            },
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            auto_install = true,
            autotag = {
                enable = true
            },
            highlight = {
                -- `false` will disable the whole extension
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true
            },
        })
    end
}
