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
		config = function()
			-- 		--      local lspconfig = require("lspconfig")
			-- 		--
			-- 		--      lspconfig.lua_ls.setup({})
			-- 		--      lspconfig.ts_ls.setup({})
			-- 		--      lspconfig.html.setup({})
			-- 		--      lspconfig.cssls.setup({})
			--
			-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			--
			-- 		vim.lsp.config("lua_ls", {
			--
			-- 			capabilities = capabilities,
			-- 		})
			-- 		vim.lsp.config("ts_ls", {
			-- 			capabilities = capabilities,
			-- 		})
			--
			-- 		vim.lsp.config("html", {
			-- 			capabilities = capabilities,
			-- 		})
			--
			-- 		vim.lsp.config("cssls", {
			-- 			capabilities = capabilities,
			-- 		})
			-- 		vim.lsp.enable("lua_ls")
			-- 		vim.lsp.enable("ts_ls")
			-- 		vim.lsp.enable("html")
			-- 		vim.lsp.enable("cssls")
			--
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			callback = function()
			-- 				vim.lsp.buf.format()
		end,
		-- 		})
		--
		-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		-- 		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		-- 		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		-- 	end,
	},

	{
		--		"hrsh7th/nvim-cmp",

		-- config = function()
		-- 	local cmp = require("cmp")
		--
		-- 	cmp.setup({
		-- 		snippet = {
		-- 			expand = function(args)
		-- 				require("luasnip").lsp_expand(args.body)
		-- 			end,
		-- 		},
		--
		-- 		mapping = cmp.mapping.preset.insert({
		-- 			["<C-Space>"] = cmp.mapping.complete(),
		-- 			["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- 		}),
		--
		-- 		sources = cmp.config.sources({
		-- 			{ name = "nvim_lsp" },
		-- 			{ name = "luasnip" },
		-- 		}),
		-- 	})
		-- end,
	},
}
