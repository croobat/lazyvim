return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
    },

    sources = {
      default = { "snippets", "lsp", "path", "buffer" },
      compat = {},
      min_keyword_length = 1,
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
