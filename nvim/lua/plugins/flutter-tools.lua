return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim',
    },
    config = function ()
        require("flutter-tools").setup {
            lsp = {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    renameFilesWithClasses = "prompt",
                    enableSnippets = true,
                    updateImportsOnRename = true,
                }
            },
            dev_log = {
                enabled = false,
                open_cmd = "vsplit",
            }
        }
    end,
    ft = "dart",
}
