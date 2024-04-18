require('formatter').setup {
    filetype = {
        --javascript = prettier, 
        --css = prettier,
        --scss = prettier,
        --json = prettier,
        --html = prettier,
        php = {
            function()
                return {
                    exe = "/usr/bin/docker exec -i phpcs phpcbf",
                    args = {
                        "-",
                    },
                    stdin = true,
                }
            end
        },
    },
    ["*"] = {
        require('formatter.filetypes.any').remove_trailing_whitespace
    }
}

vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup("Format", {
        clear = true
    }),
    pattern = {'*.php'},
    command = 'FormatWrite',
})

