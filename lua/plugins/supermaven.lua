return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {},
    config = function(_, opts)
      require("supermaven-nvim").setup(opts)
    end,
  },
}
