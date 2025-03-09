return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      compat = {},
      min_keyword_length = 2,
    },

    cmdline = {
      sources = {},
    },

    keymap = {
      preset = "default",
      ["<C-l>"] = { "select_and_accept" },
    },
  },
}
