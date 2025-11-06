-- return {
-- 	"kevinhwang91/nvim-ufo",
-- 	dependencies = { "kevinhwang91/promise-async" },
-- 	config = function()
-- 		vim.o.foldcolumn = "1" -- '0' is not bad
-- 		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- 		vim.o.foldlevelstart = 99
-- 		vim.o.foldenable = true
--
-- 		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- 		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- 		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
-- 		require("ufo").setup({
-- 			provider_selector = function(bufnr, filetype, buftype)
-- 				return { "treesitter", "indent" }
-- 			end,
-- 		})
-- 	end,
-- }
--

return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async", "neovim/nvim-lspconfig" },
	config = function()
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

		-- Capabilities for LSP
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- If you're starting LSP servers yourself, add capabilities there.
		-- If they're already started, ensure they have foldingRange support.
		-- Here's how you'd set it for new servers:
		-- require("lspconfig").<server_name>.setup({ capabilities = capabilities })

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp" }
			end,
		})
	end,
}
