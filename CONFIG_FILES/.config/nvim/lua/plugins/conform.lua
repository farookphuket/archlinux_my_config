return {
	{
		"stevearc/conform.nvim",

		event = { "BufWritePre" },

		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},

				formatters_by_ft = {
					lua = { "stylua" },

					javascript = { "prettier" },
					typescript = { "prettier" },

					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },

					css = { "prettier" },
					html = { "prettier" },

					json = { "prettier" },

					blade = { "blade-formatter" },
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				require("conform").format({
					async = true,
					lsp_fallback = true,
				})
			end)
		end,
	},
}
