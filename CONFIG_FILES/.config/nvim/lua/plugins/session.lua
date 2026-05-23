return {
	{
		"rmagatti/auto-session",

		config = function()
			require("auto-session").setup({
				auto_restore_enabled = true,
				auto_save_enabled = true,

				auto_session_suppress_dirs = {
					"~/",
					"~/Downloads",
					"/",
				},
			})

			vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session" })

			vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session" })
		end,
	},
}
