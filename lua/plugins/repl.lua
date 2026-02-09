return {
  {
    "Vigemus/iron.nvim",
    opts = {
      config = {
        repl_definition = {
          php = {
            command = {
              "psysh",
              "config.php",
              "config_server.php",
              "classAutoLoad.php",
            },
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
            command = { "lein", "repl" },
          },
        },
        repl_open_cmd = "vertical botright 80 split",
      },
      keymaps = {
        toggle_repl = "<leader>rr",
        restart_repl = "<leader>rR",
        send_line = "<leader>rl",
        visual_send = "<leader>rv",
        clear = "<leader>rc",
      },
    },
    config = function(_, opts)
      require("iron.core").setup(opts)
    end,
  },
}
