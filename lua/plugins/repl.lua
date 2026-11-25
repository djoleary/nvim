return {
  {
    "Vigemus/iron.nvim",
    opts = {
      config = {
        repl_definition = {
          php = {
            command = { "psysh" },
          },
          ocaml = {
            command = { "dune", "utop" },
            format = function(lines)
              table.insert(lines, ";;\13")
              return lines
            end,
          },
          rust = {
            command = { "irust" },
          },
          clojure = {
            command = { "clj" },
          },
        },
        -- open a horizontal split below the current buffer (same width) with a height of 10 lines
        repl_open_cmd = "horizontal rightbelow 10 split",
      },
      keymaps = {
        toggle_repl = "<leader>rr",
        restart_repl = "<leader>rR",
        send_file = "<leader>rf",
        send_line = "<leader>re",
        visual_send = "<leader>re",
        cr = "<leader>r<cr>",
        interrupt = "<leader>r<space>",
        clear = "<leader>rc",
        exit = "<leader>rq",
      },
    },
    config = function(_, opts)
      require("iron.core").setup(opts)
    end,
  },
}
