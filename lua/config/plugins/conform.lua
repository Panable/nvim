return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				php = { "prettierd" },
				sh = { "beautysh" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
