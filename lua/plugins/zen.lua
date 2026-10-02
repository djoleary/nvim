return {
  {
    "folke/zen-mode.nvim",
    keys = {
      {
        "<leader>z",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Toggle [Z]enMode",
      },
    },
    opts = {
      window = {
        width = 120,
      },
      plugins = {
        options = {
          laststatus = 3,
        },
      },
    },
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "^3.0.4",
    opts = {
      width = 100,
      buffers = {
        scratchPad = { enabled = true },
        bo = { filetype = "markdown" },
        left = { scratchPad = { pathToFile = "tmp/scratch.md" } },
        right = { scratchPad = { pathToFile = "tmp/todo.md" } },
      },
    },
  },
}
