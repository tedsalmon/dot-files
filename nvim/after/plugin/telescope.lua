local builtin = require('telescope.builtin')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {}
    },
    pickers = {
        find_files = {
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--no-ignore-vcs",
                "-g",
                "!**/.git/*",
                "-g",
                "!**/node_modules/*",
            }
        },
        live_grep = {
            additional_args = function(opts)
                return {"--hidden", "--no-ignore-vcs"}
            end
        }
    }
}
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>qf', function() builtin.live_grep() end)
vim.keymap.set('n', '<leader>ff', function() builtin.current_buffer_fuzzy_find() end)

vim.keymap.set('n', '<leader>vb', function()
    builtin.buffers({sort_mru = true, ignore_current_buffer = true})
end)

vim.keymap.set('n', '<leader>lr', function() builtin.lsp_references() end)
vim.keymap.set('n', '<leader>ls', function() builtin.lsp_workplace_symbols() end)
vim.keymap.set('n', '<leader>ld', function() builtin.diagnostics() end)

vim.keymap.set('n', '<leader>gf', function() builtin.git_files() end)
vim.keymap.set('n', '<leader>gc', function() builtin.git_commits() end)
vim.keymap.set('n', '<leader>gs', function() builtin.git_status() end)

