return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- ผูกกับ blink.cmp เพื่อดึง capabilities ความเร็วสูงมาใช้งาน
			"Saghen/blink.cmp",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- ดึงค่าความสามารถ (Capabilities) จาก blink.cmp
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- 1. Setup Lua LSP
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- 2. Setup TypeScript/JavaScript LSP
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- 3. Setup HTML LSP
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- 4. Setup CSS LSP (สยบ Warning เรื่อง @theme และ @apply ของ Tailwind v4 ที่นี่เลย 🎯)
			lspconfig.cssls.setup({
				capabilities = capabilities,
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})

			-- Auto format ก่อนเซฟไฟล์ (เปิดไว้ได้เลย สะดวกมากๆ ครับ)
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})

			-- Keymaps ยอดนิยมสำหรับจัดการโค้ด
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Info" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename Variable" })
		end,
	},
}
