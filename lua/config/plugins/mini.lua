return {
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
		end,
	},
	{
		"echasnovski/mini.align",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	-- { 'echasnovski/mini.comment', version = false },
}
