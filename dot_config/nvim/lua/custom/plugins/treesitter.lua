return {
  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  -- Plugin that shows the context of the currently visible buffer contents.
  { 'nvim-treesitter/nvim-treesitter-context', opts = {} },
}
