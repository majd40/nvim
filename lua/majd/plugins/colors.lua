return {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("monokai-pro-classic")
        vim.cmd.hi("Comment gui=none")
    end,
}
