local opt = vim.opt

----- General Options -----

opt.inccommand = "split"

-- Search options
opt.smartcase = true
opt.ignorecase = true

-- Left hand side numbers
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

opt.formatoptions:remove "o"

