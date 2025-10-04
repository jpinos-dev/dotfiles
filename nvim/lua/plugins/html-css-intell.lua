return {
  "Jezda1337/nvim-html-css",
  dependencies = { "saghen/blink.cmp", "nvim-treesitter/nvim-treesitter" },
  opts = {
    enable_on = {
      "html",
      "tsx",
      "jsx",
      "astro",
      "component.html"
    },
    documentation = {
      auto_show = true,
    },
  },
}
