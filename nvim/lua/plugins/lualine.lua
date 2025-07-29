return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    config = function()
        local statusline = require("utils.statusline")

        require("lualine").setup({
            sections = {
                -- lualine_c = {
                -- { statusline.unsaved_files }
                -- },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                        colored = true,
                        update_in_insert = false,
                        always_visible = false,
                    }
                },
            }
        })
    end
}
