local lint = require('lint')
local phpcs = require('lint.linters.phpcs')

phpcs.cmd = '/home/tsalmon/Documents/Scripts/phpcs'

lint.linters_by_ft = {
    php = {'phpcs'},
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave"}, {
    callback = function()
        lint.try_lint()
    end,
})

