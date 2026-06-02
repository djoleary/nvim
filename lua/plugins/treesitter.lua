return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- 1. Install parsers directly
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

      -- 2. Register custom parsers
      require("nvim-treesitter.parsers").blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      -- 3. Native fallback for large files
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
          if ok and stats and stats.size > max_filesize then
            vim.treesitter.stop(args.buf)
            vim.bo[args.buf].syntax = "on" -- Fallback to traditional regex highlighting
          end
        end,
      })
    end,
  },
}
