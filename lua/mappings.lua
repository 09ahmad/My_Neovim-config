require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

 map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


 -- Ctrl+Backspace to delete the previous word in insert mode;;
map("i", "<C-H>", "<C-w>")

-- Ctrl+x to delete the entire line in insert mode
map("i", "<C-x>", "<Esc>ddi")

-- Ctrl+Backspace to delete the previous word in normal mode
map("n", "<C-BS>", "db")
