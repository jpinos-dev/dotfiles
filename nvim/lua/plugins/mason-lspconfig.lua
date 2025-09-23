return {
    "williamboman/mason-lspconfig.nvim",
    version = "1.32.0",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls", "eslint" },
        })
    end,
}
