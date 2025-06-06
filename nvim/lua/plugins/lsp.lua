return {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        -- Dart LSP
        -- lspconfig.dartls.setup {
        --     capabilities = capabilities,
        --     cmd = { "dart", "language-server", "--protocol=lsp" },
        --     filetypes = { "dart" },
        --     init_options = {
        --         closingLabels = true,
        --         flutterOutline = true,
        --         onlyAnalyzeProjectsWithOpenFiles = true,
        --         outline = true,
        --         suggestFromUnimportedLibraries = true,
        --     },
        --     settings = {
        --         dart = {
        --             completeFunctionCalls = true,
        --             showTodos = true,
        --         }
        --     }
        -- }

        -- Lua LSP
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
                    telemetry = { enable = false },
                }
            }
        }

        -- Java LSP
        lspconfig.jdtls.setup {
            capabilities = capabilities,
            settings = {
                format = {
                    enabled = true,
                }
            }
        }

        -- Typescript LSP
        lspconfig.ts_ls.setup {
            capabilities = capabilities,
        }

        -- Eslint LSP
        lspconfig.eslint.setup {
            capabilities = capabilities,
        }

        -- Go LSP
        lspconfig.gopls.setup {
            capabilities = capabilities,
            settings = {
                gopls = {
                    semanticTokens = true,
                }
            }
        }

        -- PowerShell LSP
        lspconfig.powershell_es.setup {
            capabilities = capabilities,
            bundle_path = "~/Documents/Desarrollo/SDKs/PowerShellEditorServices"
        }

        -- Bash LSP
        lspconfig.bashls.setup {
            capabilities = capabilities,
        }
    end,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp"
    }
}
