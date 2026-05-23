return {
	"lukas-reineke/indent-blankline.nvim",

	main = "ibl",

	config = function()
		require("ibl").setup({
			indent = {
				char = "│",
			},

			scope = {
				enabled = true,
			},

			exclude = {
				filetypes = {
					"help",
					"dashboard",
					"neo-tree",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
				},
			},
		})
	end,
}
