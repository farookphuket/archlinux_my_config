return {
	"folke/which-key.nvim",

	event = "VeryLazy",

	config = function()
		local wk = require("which-key")

		wk.setup({})

		wk.add({
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>t", group = "terminal" },
			{ "<leader>c", group = "code" },
			{ "<leader>w", desc = "save file" },
			{ "<leader>q", desc = "quit" },

			{ "<leader>ff", desc = "find files" },
			{ "<leader>fg", desc = "live grep" },

			{ "<leader>e", desc = "toggle explorer" },
			{ "<leader>ca", desc = "code action" },
			{ "<leader>rn", desc = "rename symbol" },
			{ "<leader>/", desc = "List Buffer" },

			{ "<leader>g", group = "git" },

			{ "<leader>gp", desc = "preview hunk" },
			{ "<leader>gb", desc = "blame line" },
			{ "<leader>gr", desc = "reset hunk" },
			{ "<leader>gs", desc = "stage hunk" },
		})
	end,
}
