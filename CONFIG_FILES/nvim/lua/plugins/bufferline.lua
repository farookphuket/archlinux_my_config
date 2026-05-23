return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					separator_style = "slant",
					diagnostics = "nvim_lsp",
					always_show_bufferline = true,
				},
			})

			vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
			vim.keymap.set("n", "<leader>x", ":bdelete<CR>")
		end,
	},
}
