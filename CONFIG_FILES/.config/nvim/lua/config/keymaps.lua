vim.g.mapleader = " "

local keymap = vim.keymap

-- save
keymap.set("n", "<leader>w", ":w<CR>")

-- quit
keymap.set("n", "<leader>q", ":q<CR>")

-- clear search
keymap.set("n", "<Esc>", ":noh<CR>")

-- neo-tree
keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

-- toggleterm.nvim
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })

-- buffers
-- keymap.set("n", "<leader>/", ":ls<CR>", { desc = "List Buffers" })
keymap.set("n", "<leader>/", ":Telescope buffers<CR>", {
	desc = "Search Buffers",
})

-- move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
