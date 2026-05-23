return {
	"lewis6991/gitsigns.nvim",

	config = function()
		require("gitsigns").setup()

		local gs = package.loaded.gitsigns

		-- keymaps
		vim.keymap.set("n", "]h", gs.next_hunk, {
			desc = "Next Git Hunk",
		})

		vim.keymap.set("n", "[h", gs.prev_hunk, {
			desc = "Prev Git Hunk",
		})

		vim.keymap.set("n", "<leader>gp", gs.preview_hunk, {
			desc = "Preview Git Hunk",
		})

		vim.keymap.set("n", "<leader>gb", gs.blame_line, {
			desc = "Git Blame Line",
		})

		vim.keymap.set("n", "<leader>gr", gs.reset_hunk, {
			desc = "Reset Hunk",
		})

		vim.keymap.set("n", "<leader>gs", gs.stage_hunk, {
			desc = "Stage Hunk",
		})
	end,
}
