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

        vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)
    end,
}
