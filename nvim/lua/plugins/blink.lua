return {
  "saghen/blink.cmp",
  event = "VimEnter",
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        return 'make install_jsregexp'
      end)(),
      dependencies = {

      },
      opts = {},
    },
    'folke/lazydev.nvim',
  },
  --- @module 'blink-cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      ['<Tab>'] = {},

      preset = "default"
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 }
      }
    },

    snippets = { preset = 'luasnip' },

    fuzzy = { implementation = 'lua' },

    signature = { enabled = true },
  }
}
