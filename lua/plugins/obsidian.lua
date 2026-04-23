return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
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
        },
        {
          name = "no-vault",
          path = function()
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
          end,
          overrides = {
            notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
            new_notes_location = "current_dir",
            templates = {
              folder = vim.NIL,
            },
            disable_frontmatter = true,
          },
        },
      },
      disable_frontmatter = true,
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
      vim.opt.conceallevel = 1
    end,
  },
}
