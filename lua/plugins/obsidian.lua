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
            -- Override the default to drop the id
            note_path_func = function(spec)
              local path = spec.dir / tostring(spec.title)
              return path:with_suffix(".md")
            end,
            note_frontmatter_func = function(note)
              local out = { tags = note.tags }

              -- from the plugin's readme ------------->

              -- `note.metadata` contains any manually added fields in the frontmatter.
              -- So here we just make sure those fields are kept in the frontmatter.
              if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                  out[k] = v
                end
              end

              -- from the plugin's readme <-------------

              return out
            end,
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
