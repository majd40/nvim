return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        { "j-hui/fidget.nvim", opts = {} },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- Mason setup
        require("mason").setup()
        require("mason-lspconfig").setup({ automatic_installation = true })

        -- LSP server setup with nvim-cmp integration
        require("mason-lspconfig").setup_handlers({
            function(server)
                require("lspconfig")[server].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                })
            end,
        })

        -- LSP keymaps setup
        local function on_attach(_, bufnr)
            local map = function(keys, func, desc)
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
            end
            local telescope = require("telescope.builtin")
            map("gd", telescope.lsp_definitions, "Go to Definition")
            map("gr", telescope.lsp_references, "Go to References")
            map("gI", telescope.lsp_implementations, "Go to Implementation")
            map("<leader>D", telescope.lsp_type_definitions, "Type Definition")
            map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
            map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
            map("K", vim.lsp.buf.hover, "Hover Documentation")
            map("gD", vim.lsp.buf.declaration, "Go to Declaration")
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = on_attach,
        })

        -- Autocompletion setup
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup({
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-s>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-l>"] = cmp.mapping(function() if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function() if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
        })

        -- Diagnostic settings
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
            },
        })
    end,
}
