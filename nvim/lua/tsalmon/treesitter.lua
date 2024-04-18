require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
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
    auto_install = true,
    enable = true,
    autotag = {
        enable = true
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
}
