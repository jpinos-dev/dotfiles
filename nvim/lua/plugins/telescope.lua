return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "%.class", "^bin/", "^build/", "^node_modules/" }
            }
        })
    end,
}
