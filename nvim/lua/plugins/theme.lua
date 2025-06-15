-- return {
--   "savq/melange-nvim",
--   config = function ()
--     vim.cmd("colorscheme melange")
--   end
-- }
-- return {
--     "AlexvZyl/nordic.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function ()
--         require("nordic").load()
--     end
-- }
-- return {
--     "navarasu/onedark.nvim",
--     config = function ()
--         require("onedark").setup {
--             style = "darker"
--         }
-- 
--         require("onedark").load()
--     end
-- }
return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        vim.cmd("colorscheme rose-pine-moon")
    end,
}
