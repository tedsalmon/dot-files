return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        -- Enable comments in HTML, TSX, etc
        local comment = require("Comment")
        local ctx_comments = require("ts_context_commentstring.integrations.comment_nvim")
        comment.setup({
            pre_hook = ctx_comments.create_pre_hook(),
        })
    end,
}
