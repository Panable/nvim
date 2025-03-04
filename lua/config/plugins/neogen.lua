return {
	"danymat/neogen",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	cmd = "Neogen",
	config = true,
	init = function()
		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<Leader>af", ":lua require('neogen').generate()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>ac", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>at", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>aF", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
		vim.keymap.set("n", "<leader>ld", function()
			vim.ui.select({ "auto", "func", "class", "type", "file" }, {
				prompt = "Select Neogen scheme",
				telescope = require("telescope.themes").get_dropdown(),
			}, function(scheme)
				if scheme == nil then
					return
				end
				if scheme == "auto" then
					scheme = ""
				end
				vim.cmd("Neogen" .. " " .. scheme)
			end)
		end, { desc = "Neogen | Generate Docs", silent = true })
	end,

	opts = {
		snippet_engine = "luasnip",
		enabled = true,
		languages = {
			cs = {
				template = {
					annotation_convention = "xmldoc",
				},
			},
			python = {
				template = {
					annotation_convention = "numpydoc",
				},
			},
		},
	},
}
