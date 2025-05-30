return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
        require("toggleterm").setup({
            size = function (term)
                if term.direction == "horizontal" then
                    return math.floor(vim.o.lines * 0.5)
                end
                return 20
            end,
            open_mapping = [[<c-\>]],
            direction = "horizontal",
            shade_terminals = true,
            start_in_insert = true,
            persist_size = true,
            close_on_exit = true,
        })

        vim.keymap.set("n", "<leader>ot", function ()
            require("toggleterm").toggle(0, nil, nil, "horizontal")
        end, { desc = "Toggle terminal horizontal" })

        vim.keymap.set("t", "<C-t>",[[<C-\><C-n>:lua require("toggleterm").toggle(0, nil, nil, "horizontal")<CR>]], { desc = "Toggle terminal"})
    end
}
