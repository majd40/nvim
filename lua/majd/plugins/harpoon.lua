return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VimEnter",
    init = function()
        local harpoon = require("harpoon")

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>g1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>g2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>g3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>g4", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>g5", function() harpoon:list():select(5) end)
        vim.keymap.set("n", "<leader>g6", function() harpoon:list():select(6) end)
        vim.keymap.set("n", "<leader>g7", function() harpoon:list():select(7) end)
        vim.keymap.set("n", "<leader>g8", function() harpoon:list():select(8) end)
        vim.keymap.set("n", "<leader>g9", function() harpoon:list():select(9) end)
    end,
}
