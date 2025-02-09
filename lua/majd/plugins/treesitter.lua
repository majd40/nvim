-- syntax highlighting and parsing tool
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "lua",
                "bash", "html", "markdown", "vim", "scss",
                "css", "python", "java", "json", "sql"
            },
            sync_install = false,
            auto_install = true,
            indent = { enable = true },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            matchup = { enable = true }
        })
    end
}
