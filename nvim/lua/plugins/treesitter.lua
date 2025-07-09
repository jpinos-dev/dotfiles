return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "go", "lua", "vim", "bash", "html", "css", "tsx", "dart" },
            highlight = { enable = true },
            fold = {
                enable = true,
                disable = { "go" }, -- Go folding is handled by gopls
            },
        }

        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
        vim.wo.foldenable = true
        vim.wo.foldlevel = 99
    end
}
