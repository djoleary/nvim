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
}
