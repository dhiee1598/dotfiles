return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header --
		dashboard.section.header.val = {
			"                                                ",
			"███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗",
			"████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║",
			"██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║",
			"██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║",
			"██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║",
			"╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝",
			"                                                ",
		}

		-- Set Menu --
		dashboard.section.buttons.val = {
			dashboard.button("e", "○  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "○  > Open file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC fs", "○  > Find word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("q", "○  > Quit neovim", "<cmd>qa<CR>"),
		}

		-- Send config to alpha --
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer --
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
