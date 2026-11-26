return {
  {
    -- https://github.com/tpope/vim-fireplace
    "tpope/vim-fireplace",
    ft = "clojure",
  },
  {
    -- https://github.com/tpope/vim-salve
    "tpope/vim-salve",
    ft = "clojure",
  },
  {
    -- https://github.com/guns/vim-sexp
    "guns/vim-sexp",
    ft = "clojure",
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
