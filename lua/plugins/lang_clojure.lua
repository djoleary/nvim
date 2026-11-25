return {
  {
    -- https://github.com/tpope/vim-fireplace
    "tpope/vim-fireplace",
    ft = "clojure",
  },
  {
    -- https://github.com/guns/vim-sexp
    "guns/vim-sexp",
    ft = "clojure",
    -- Default config from `:help sexp-lazy-install`
    init = function()
      -- General plugin option settings
      vim.g.sexp_indent_does_clean = 1
      vim.g.sexp_clone_does_indent = 1
      vim.g.sexp_indent_aligns_comments = 1
    end,
  },
  {
    -- https://github.com/tpope/vim-sexp-mappings-for-regular-people
    "tpope/vim-sexp-mappings-for-regular-people",
    ft = "clojure",
    dependencies = {
      { "guns/vim-sexp" },
    },
  },
}
