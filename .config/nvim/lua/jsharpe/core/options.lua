local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.smartindent = true

-- line wrapping
opt.wrap = false
opt.scrolloff = 8

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")


--split windows
opt.splitright = true
opt.splitbelow = true

-- undo history
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
opt.undofile = true

opt.iskeyword:append("-")
