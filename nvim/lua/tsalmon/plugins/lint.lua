return {
   "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    config = function ()
        local lint = require("lint")
        local phpcs = require("lint.linters.phpcs")
        phpcs.cmd = "/home/tsalmon/Documents/Scripts/phpcs"

        lint.linters_by_ft = {
            php = { "phpcs" },
        }
    end,
}

