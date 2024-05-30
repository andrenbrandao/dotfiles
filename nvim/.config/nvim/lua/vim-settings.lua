vim.g.mapleader = " "

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true

-- set number & relative numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- save undo history
vim.o.undofile = true

-- case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- move visual lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeps cursor on the beginning when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- center when going down or up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center screen on next search calls
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- always copy to clipboard
vim.opt.clipboard = "unnamedplus"

-- paste last copied line but do not yank current selection
-- this will prevent pasting to replace what we had copied at first
vim.keymap.set("v", "<leader>p", '"_dP')

-- Prevents user from keep pressing jk letters to navigate.
-- local discipline = require("discipline")
-- discipline.cowboy()
