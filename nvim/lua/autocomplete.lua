require('blink.cmp').setup({
  -- 'default' for mappings similar to built-in completion
  keymap = {
      preset = 'enter',
      ["<Tab>"] = { 'select_next', 'fallback' },

      keymap = { preset = 'default' },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})
