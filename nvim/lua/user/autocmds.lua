local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
autocmd({"FileType", "BufRead", "BufNewFile"}, {
	pattern = "*.md",
	command = "setlocal spell spelllang=es"
})
