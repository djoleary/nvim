return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Install parsers directly
      local parsers = {
        "lua",
        "nix",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "bash",
        "html",
        "php",
        "phpdoc",
        "go",
        "json",
        "sql",
        "rust",
        "ocaml",
      }
      -- This filters out existing parsers and installs missing ones asynchronously.
      require("nvim-treesitter").install(parsers)
    end,
  },
}
