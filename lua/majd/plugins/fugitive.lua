return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n","<leader>gc", vim.cmd.Git)
    end
}
