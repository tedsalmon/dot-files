vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('mbbill/undotree')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use('Mofiqul/vscode.nvim')
    use('windwp/nvim-autopairs')
    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    }
    use('stevearc/aerial.nvim')
    use('terrortylor/nvim-comment')
    use('tzachar/local-highlight.nvim')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use('famiu/bufdelete.nvim')
    use('ThePrimeagen/vim-be-good')
    use('mfussenegger/nvim-lint')
    use{'mhartington/formatter.nvim'}
    use{
        'windwp/nvim-ts-autotag',
        config = function ()
            require("plugins.configs.treesitter")
        end,
    }
end)
