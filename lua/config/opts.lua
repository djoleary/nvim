-- [[ Setting options ]]
-- See `:help vim.opt`

-- Set highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Make line numbers default
vim.opt.nu = true
vim.opt.relativenumber = true

-- Enable mouse for all modes
vim.opt.mouse = "a"

-- Backup indentation rules
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Prevent cursor from leaving middle of screen (where possible)
vim.opt.scrolloff = 999

-- Editor columns
vim.opt.colorcolumn = {
  "80",
  "100",
}

-- Enable break indent
vim.opt.breakindent = true

-- Disable swap files
vim.opt.swapfile = false

-- Disable backup files
vim.opt.backup = false

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Enable sign column
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.opt.termguicolors = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

--
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- Wrap
vim.opt.linebreak = true
vim.opt.wrap = false

-- make
vim.opt.makeprg = "task"

-- markdown
vim.opt.conceallevel = 2
