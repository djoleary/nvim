return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.2.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      pickers = {
        live_grep = {
          theme = "ivy",
        },
        grep_string = {
          theme = "ivy",
        },
        help_tags = {
          theme = "ivy",
        },
      },
      extensions = {
        fzf = {},
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")

      local builtins = require("telescope.builtin")

      vim.keymap.set("n", "<leader>sb", builtins.buffers, { desc = "[S]earch [B]uffers" })
      vim.keymap.set("n", "<leader>sc", function()
        builtins.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [C]onfig" })
      vim.keymap.set("n", "<leader>sf", function()
        builtins.find_files({ hidden = true, no_ignore = true })
      end, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>sg", builtins.git_files, { desc = "[S]earch Tracked [G]it Files" })
      vim.keymap.set("n", "<leader>sh", builtins.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtins.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>sm", builtins.marks, { desc = "[S]earch [M]arks" })
      vim.keymap.set("n", "<leader>sq", builtins.quickfix, { desc = "[S]earch [Q]uickfix" })
      vim.keymap.set("n", "<leader>sr", builtins.registers, { desc = "[S]earch [R]egisters" })
      vim.keymap.set("n", "<leader>ss", builtins.live_grep, { desc = "[S]earch [S]tring" })
      vim.keymap.set("n", "<leader>st", builtins.spell_suggest, { desc = "[S]earch [T]ypo Correction" })
      vim.keymap.set("n", "<leader>sw", builtins.grep_string, { desc = "[S]earch [W]ord" })
    end,
  },
}
