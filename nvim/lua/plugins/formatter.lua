return {
    "mhartington/formatter.nvim",
    config = function()
        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                -- dart = {
                --     require("formatter.filetypes.dart").dartformat
                -- },
            }
        })
    end,
}
