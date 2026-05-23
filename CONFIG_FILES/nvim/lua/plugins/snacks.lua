return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,

		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			explorer = { enabled = false },

			indent = { enabled = true },

			input = { enabled = true },

			notifier = {
				enabled = true,
				timeout = 3000,
			},

			picker = { enabled = true },

			quickfile = { enabled = true },

			scope = { enabled = true },

			scroll = { enabled = true },

			statuscolumn = { enabled = true },

			words = { enabled = true },
		},

		keys = {
			{
				"<leader>sf",
				function()
					Snacks.picker.files()
				end,
				desc = "Snacks Find Files",
			},

			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Snacks Grep",
			},

			{
				"<leader>sb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},

			{
				"<leader>sn",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
		},
	},
}
