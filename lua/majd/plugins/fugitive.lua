return {
    "tpope/vim-fugitive",
    keys = {
        -- Open Git status
        { "<leader>gc", ":Git<CR>", desc = "Open Git status" },

        -- Open Git blame
        { "<leader>gb", ":Git blame<CR>", desc = "Git blame" },
    },
}
