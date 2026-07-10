return {
	{
		"mg979/vim-visual-multi",

		init = function()
			vim.g.VM_maps = {
				["Find Under"] = "<C-n>",
				["Find Subword Under"] = "<C-n>",
				["Select All"] = "\\A",
			}

			-- ปิด default mapping บางตัวที่ชนกับ cmp
			vim.g.VM_default_mappings = 0
		end,
	},
}
