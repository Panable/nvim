return {
	"ej-shafran/compile-mode.nvim",
	-- you can just use the latest version:
	-- branch = "latest",
	-- or the most up-to-date updates:
	-- branch = "nightly",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- if you want to enable coloring of ANSI escape codes in
		-- compilation output, add:
		-- { "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {

	recompile_no_fail=true,
			-- to add ANSI escape code support, add:
			-- baleia_setup = true,
		}
	recompile_no_fail=true,
	vim.keymap.set("n", "<leader>cc", "<cmd>Recompile 10<cr>", { desc = "Recompile" })
	vim.keymap.set("n", "<leader>cn", "<cmd>NextError<cr>", { desc = "Error" })
	vim.keymap.set("n", "<leader>cp", "<cmd>PrevError<cr>", { desc = "Error" })

	end,
}
