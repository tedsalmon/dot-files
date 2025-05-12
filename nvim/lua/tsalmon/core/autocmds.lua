local cmd_group = vim.api.nvim_create_augroup('MyCmdGroup', {})

-- Formatter
vim.api.nvim_create_autocmd("BufWritePost", {
    group = cmd_group,
    pattern = {"*.php"},
    command = "FormatWrite",
})

-- Trailing Whitespace removal
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%s/\s\+$//e]] end)
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Lint
vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave"}, {
    group = cmd_group,
    callback = function()
        require("lint").try_lint()
    end,
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = cmd_group,
    callback = function()
        local opts = { buffer = bufnr, noremap = true, silent = true }
        -- lsp.async_autoformat(client, bufnr)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vs", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set({ "n", "v" }, "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
    end,
})
