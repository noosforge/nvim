vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.autoread = true -- required for :checktime (see autocmds.lua) to actually reload changed buffers
opt.termguicolors = true
opt.clipboard = "unnamedplus"

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true

opt.pumheight = 10 -- cap the completion popup at 10 items instead of filling the screen
