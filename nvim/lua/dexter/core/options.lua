vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- Tab and Indentation --
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- Search Settings --
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- Backspace --
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Split Windows --
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
