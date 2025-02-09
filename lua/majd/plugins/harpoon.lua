return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VimEnter",
    config = function()
        local harpoon = require("harpoon")

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

        -- Loop to set keymaps for selecting harpoon files (avoids redundancy)
        for i = 1, 9 do
            vim.keymap.set("n", "<leader>g" .. i, function() harpoon:list():select(i) end, { desc = "Harpoon file " .. i })
        end
    end,
}
