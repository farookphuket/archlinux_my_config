return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("oil").setup({
				default_file_explorer = true,

				columns = {
					"icon",
					"permissions",
					"size",
					"mtime",
				},

				view_options = {
					show_hidden = true,
				},

				float = {
					padding = 2,
					max_width = 100,
					max_height = 40,
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
				desc = "Open parent directory",
			})
		end,
	},
}
