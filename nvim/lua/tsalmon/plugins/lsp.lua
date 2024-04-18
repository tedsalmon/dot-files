return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "VonHeikemen/lsp-zero.nvim",
    },
    config = function()
        local lsp = require('lsp-zero')
        local cmp = require('cmp')
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'clangd', 'lua_ls', 'rust_analyzer'},
            handlers = {
                lsp_zero.default_setup,
            },
        })


        lsp.preset("recommended")

        lsp.set_preferences({
            suggest_lsp_servers = false,
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            }
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' }, -- For vsnip users.
            }, {
                { name = 'buffer' },
            })
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            }, {
                { name = 'buffer' },
            })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })

        lsp.on_attach(function(client, bufnr)
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
        end)

        local get_intelephense_license = function()
            local f = assert(io.open(os.getenv('HOME') .. '/.intelephense', 'r'))
            local content = f:read("*all")
            f:close()
            return string.gsub(content, "%s+", '')
        end

        require('lspconfig').intelephense.setup {
            before_init = function(params)
                params.processId = vim.NIL
            end,
            init_options = {
                licenceKey = get_intelephense_license()
            },
            cmd = { 'docker', 'container', 'run', '--interactive', '--rm', '--workdir=' .. vim.fn.getcwd(), '--volume=' .. vim.fn.getcwd() .. ':' .. vim.fn.getcwd(), 'alpine-intelephense' },
            root_dir = require('lspconfig/util').root_pattern(".git", vim.fn.getcwd()),
            filetypes = { 'php', 'phtml' },
        }

        require('lspconfig').tsserver.setup {
            before_init = function(params)
                params.processId = vim.NIL
            end,
            cmd = { 'docker', 'container', 'run', '--interactive', '--rm', '--workdir=' .. vim.fn.getcwd(), '--volume=' .. vim.fn.getcwd() .. ':' .. vim.fn.getcwd(), 'alpine-tsserver' },
            root_dir = require('lspconfig/util').root_pattern(".git", vim.fn.getcwd()),
        }

        require('lspconfig').pyright.setup {
            before_init = function(params)
                params.processId = vim.NIL
            end,
            cmd = { 'docker', 'container', 'run', '--interactive', '--rm', '--workdir=' .. vim.fn.getcwd(), '--volume=' .. vim.fn.getcwd() .. ':' .. vim.fn.getcwd(), 'alpine-pyright' },
        }

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true,
            float = {
                source = 'always',
                border = border
            },
        })
    end,
}
