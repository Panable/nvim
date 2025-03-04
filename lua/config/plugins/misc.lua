return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{
		"numToStr/Comment.nvim",
		init = function()
			require('Comment').setup()
		end,
	},
}
