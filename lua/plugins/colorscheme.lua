return {
	-- gruvbox
	{ "ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard"
			})
			-- load the colorscheme
			vim.cmd([[colorscheme gruvbox]])
		end
	}
}
