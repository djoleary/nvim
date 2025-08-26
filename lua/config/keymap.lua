-- [[ Basic Keymaps ]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Keymaps for better default experience

vim.keymap.set(
  { "n", "v" },
  "<Space>",
  "<Nop>",
  { silent = true, desc = "Set <Space> to a <Nop> so it can be used as the leader" }
)
vim.keymap.set({ "n", "v" }, "Q", "<Nop>", { silent = true, desc = "Set Q to a <Nop> to prevent exiting by accident" })

vim.keymap.set(
  "n",
  "k",
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true, desc = "Treat wrapped lines as single lines when moving upwards" }
)
vim.keymap.set(
  "n",
  "j",
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true, desc = "Treat wrapped lines as single lines when moving downwards" }
)

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move current line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move current line down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Keep cursor at beginning of line when joining" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor when jumping up a half-screen" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor when jumping down a half-screen" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center cursor when jumping to the next occurence" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center cursor when jumping to the previous occurence" })

vim.keymap.set("n", "<C-w><", "5<C-w><", { desc = "Resize split" })
vim.keymap.set("n", "<C-w>>", "5<C-w>>", { desc = "Resize split" })
