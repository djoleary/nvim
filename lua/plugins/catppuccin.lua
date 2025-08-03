return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      integrations = {
        blink_cmp = true,
        dap = true,
        dap_ui = true,
        harpoon = true,
        lsp_trouble = true,
        nvim_surround = true,
      },
    },
  },
}
