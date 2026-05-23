return {
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		require("toggleterm").setup({
			size = 35,
			open_mapping = [[<c-\>]],

			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,

			start_in_insert = true,
			insert_mappings = true,

			persist_size = true,
			direction = "horizontal",

			close_on_exit = true,
			shell = vim.o.shell,
		})

		-- keymap
		vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", {
			noremap = true,
			silent = true,
			desc = "Toggle Terminal",
		})
	end,
}
