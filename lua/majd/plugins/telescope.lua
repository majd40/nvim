-- fuzzy finder to quickly search for files, symbols, diagnostics, and more
return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable("make") == 1 end,
        },
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

        -- Setup Telescope and extensions
        telescope.setup({
            extensions = {
                ["ui-select"] = themes.get_dropdown(),
            },
        })

        -- Load extensions safely
        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")

        -- Keymaps for Telescope functions
        local mappings = {
            ["<leader>pf"] = { builtin.find_files, "Search Files" },
            ["<C-p>"] = { builtin.git_files, "Search Git Files" },
            ["<leader>ps"] = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, "Search by Grep" },
            ["<leader>sh"] = { builtin.help_tags, "Search Help" },
            ["<leader>sk"] = { builtin.keymaps, "Search Keymaps" },
            ["<leader>ss"] = { builtin.builtin, "Search Telescope Options" },
            ["<leader>sg"] = { builtin.live_grep, "Search by Grep" },
            ["<leader>sd"] = { builtin.diagnostics, "Search Diagnostics" },
            ["<leader>sr"] = { builtin.resume, "Resume Last Search" },
            ["<leader>s."] = { builtin.oldfiles, "Search Recent Files" },
            ["<leader><leader>"] = { builtin.buffers, "Find Existing Buffers" },
            ["<leader>/"] = { function() builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false })) end, "Fuzzily Search in Current Buffer" },
            ["<leader>s/"] = { function() builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" }) end, "Search in Open Files" },
            ["<leader>sn"] = { function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end, "Search Neovim Config Files" },
        }

        -- Set up the keymaps
        for key, map in pairs(mappings) do
            vim.keymap.set("n", key, map[1], { desc = map[2] })
        end
    end,
}
