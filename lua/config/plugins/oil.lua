return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Oil [E]xplore" }),
}
