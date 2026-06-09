require("config.highlightYank")
require("config.keymap")
require("config.opts")
require("config.treesitter")

-- Call last to ensure keymaps are respected
require("config.lazy")

-- Call package dependent configurations
require("config.lsp")
