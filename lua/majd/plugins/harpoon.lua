return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VimEnter",
    init = function()
        local ui = require("harpoon.ui")
        local mark = require("harpoon.mark")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<leader>g1", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>g2", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>g3", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>g4", function() ui.nav_file(4) end)
        vim.keymap.set("n", "<leader>g5", function() ui.nav_file(5) end)
        vim.keymap.set("n", "<leader>g6", function() ui.nav_file(6) end)
        vim.keymap.set("n", "<leader>g7", function() ui.nav_file(7) end)
        vim.keymap.set("n", "<leader>g8", function() ui.nav_file(8) end)
        vim.keymap.set("n", "<leader>g9", function() ui.nav_file(9) end)
    end,
}
