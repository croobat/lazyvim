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
      cmdline = {},
      min_keyword_length = 2,
    },

    keymap = {
      preset = "default",
      ["<C-l>"] = { "select_and_accept" },
    },
  },
}
