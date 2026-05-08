-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- copy from https://neovim.discourse.group/t/how-to-have-a-soft-word-wrap-without-messing-with-vertical-splits/4246
--
vim.o.textwidth = 0
vim.o.wrapmargin = 0
-- visual wrap (no real line cutting is made)
vim.o.wrap = true
vim.o.linebreak = true -- breaks by word rather than character

vim.opt_local.columns = 80
