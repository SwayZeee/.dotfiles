return {
  'saghen/blink.cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  opts = {
    snippets = { preset = 'luasnip' },
    keymap = {
      preset = 'none',
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
    },
  },
}
