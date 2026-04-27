return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "nix",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "bash",
        "html",
        -- work
        "php",
        "phpdoc",
        "go",
        "json",
        "sql",
        -- project
        "rust",
        "ocaml",
      },

      sync_install = false,
      auto_install = true,
      ignore_install = {},

      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      parser_configs = {
        blade = {
          install_info = {
            url = "https://github.com/EmranMR/tree-sitter-blade",
            files = { "src/parser.c" },
            branch = "main",
          },
          pattern = {
            [".*%.blade%.php"] = "blade",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      for k, v in ipairs(opts.parser_configs) do
        if v.install_info then
          parser_config[k] = {
            install_info = v.install_info,
            filetype = k,
          }
        end

        if v.pattern then
          vim.filetype.add({
            pattern = v.pattern,
          })
        end
      end
    end,
  },
}
