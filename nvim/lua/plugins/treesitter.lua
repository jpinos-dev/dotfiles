return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "go", "lua", "vim", "bash", "html", "css", "tsx" },
            highlight = { enable = true }
        }
    end
}
