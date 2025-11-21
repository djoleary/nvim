return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
        lua = { "luacheck" },
        nix = { "nix" },
        php = { "phpstan" },
        rust = { "clippy" },
        yaml = { "redocly" },
      },
      linter_args = {
        phpstan = {
          "analyze",
          "--error-format=json",
          "--level=8",
          "--no-progress",
        },
      },
    },
    config = function(_, opts)
      local lint = require("lint")

      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })

      for linter, args in ipairs(opts.linter_args) do
        lint.linters[linter].args = args
      end
    end,
  },
}
