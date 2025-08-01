-- return {
--   "savq/melange-nvim",
--   config = function()
--     vim.cmd("colorscheme melange")
--   end
-- }
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd("colorscheme rose-pine-moon")
--   end,
-- }
--return {
--  "sainnhe/gruvbox-material",
--  lazy = false,
--  priority = 1000,
--  opts = {},
--  config = function()
--    vim.cmd("colorscheme gruvbox-material")
--  end
--}
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     transparent_background = false,
--     term_colors = true,
--     styles = {
--       comments = { "italic" },
--       conditionals = { "italic" },
--       functions = { "bold" },
--       keywords = { "bold" },
--       strings = { "italic" },
--       variables = {},
--       numbers = {},
--       operators = {},
--     },
--   },
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }
-- return {
--   "shaunsingh/nord.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme nord")
--   end
-- }
return {
  "blazkowolf/gruber-darker.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme gruber-darker")
  end
}
-- return {
--   "thesimonho/kanagawa-paper.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme kanagawa-paper")
--   end
-- }
