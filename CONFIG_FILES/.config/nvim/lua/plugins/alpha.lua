return {
	"goolord/alpha-nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                   ]],
			[[   ███████╗ █████╗ ██████╗  ██████╗  ██████╗ ██╗  ██╗ ]],
			[[   ██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔═══██╗██║ ██╔╝ ]],
			[[   █████╗  ███████║██████╔╝██║   ██║██║   ██║█████╔╝  ]],
			[[   ██╔══╝  ██╔══██║██╔══██╗██║   ██║██║   ██║██╔═██╗  ]],
			[[   ██║     ██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║  ██╗ ]],
			[[   ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ]],
			[[                                                   ]],
			[[          ⚡ Welcome back, Farook ⚡                ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),

			dashboard.button("f", "󰱼  Find file", ":Telescope find_files<CR>"),

			dashboard.button("g", "󰱼  Find text", ":Telescope live_grep<CR>"),

			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),

			dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),

			dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = {
			"",
			"⚡ my-chatgpt-nvim loaded successfully ⚡",
		}

		alpha.setup(dashboard.opts)
	end,
}
