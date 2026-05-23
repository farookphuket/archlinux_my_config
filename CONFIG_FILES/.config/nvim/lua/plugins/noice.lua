return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",

		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},

		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})

			vim.notify = require("notify")

			require("noice").setup({
				lsp = {
					progress = {
						enabled = true,
					},

					hover = {
						enabled = true,
					},

					signature = {
						enabled = true,
					},
				},

				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = true,
				},
			})

			vim.keymap.set("n", "<leader>nn", "<cmd>Noice<CR>", {
				desc = "Open Noice history",
			})
		end,
	},
}
