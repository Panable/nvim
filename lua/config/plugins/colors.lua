return {
	"blazkowolf/gruber-darker.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	init = function()
		vim.cmd.colorscheme("gruber-darker")
		vim.cmd.hi("Comment gui=none")
	end,
}
