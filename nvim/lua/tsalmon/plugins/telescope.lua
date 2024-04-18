return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function ()
        local builtin = require("telescope.builtin")
        require("telescope").setup{
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
        vim.keymap.set("n", "<leader>pf", builtin.find_files) 
        vim.keymap.set("n", "<leader>qf", builtin.live_grep)
        vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find)

        vim.keymap.set("n", "<leader>vb", function()
            builtin.buffers({sort_mru = true, ignore_current_buffer = true})
        end)

        vim.keymap.set("n", "<leader>lr", builtin.lsp_references)
        vim.keymap.set("n", "<leader>ld", builtin.diagnostics)

        vim.keymap.set("n", "<leader>gf", builtin.git_files)
        vim.keymap.set("n", "<leader>gc", builtin.git_commits)
        vim.keymap.set("n", "<leader>gs", builtin.git_status)
    end
}
