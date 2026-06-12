return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter",
    },
    opts = {
      workspaces = {
        {
          name = "idle_thoughts",
          path = "~/personal/idle_thoughts",
          overrides = {
            daily_notes = {
              folder = "daily",
              date_format = "%Y-%m-%d",
              default_tags = { "archive/daily" },
              template = "Daily Template.md",
            },
            templates = {
              folder = "_templates",
            },
            attachments = {
              img_folder = "_attachments",
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      vim.keymap.set("n", "<leader>sn", "<CMD>ObsidianQuickSwitch<CR>", { desc = "[S]earch [N]otes" })
    end,
  },
}
