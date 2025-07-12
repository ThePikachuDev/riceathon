return { {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    config = function()
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

        require("ufo").setup({
            provider_selector = function(_, _, _)
                return { "treesitter", "indent" }
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        -- Mason way (if you use it)
        local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
        if ok then
            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            })
        end
    end,
}, {

    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
}, {
    "voltycodes/areyoulockedin.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
        require("areyoulockedin").setup({
            session_key = "084c40de-0af0-4ef4-ab7e-3510b379159a",
        })
    end,
}, {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    enabled = false,
    version = "1.*",
    opts = {
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = { documentation = { auto_show = false } },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" }, },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}, {
    "S1M0N38/love2d.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "<leader>v",  ft = "lua",          desc = "LÖVE" },
        { "<leader>vv", "<cmd>LoveRun<cr>",  ft = "lua",   desc = "Run LÖVE" },
        { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua",   desc = "Stop LÖVE" },
    },
}, {
    "davidmh/mdx.nvim",
    config = true,
    event = "BufEnter *.mdx",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
}, {
    'vimwiki/vimwiki'
}
}
